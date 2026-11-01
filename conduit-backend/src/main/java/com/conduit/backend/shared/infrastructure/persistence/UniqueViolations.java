package com.conduit.backend.shared.infrastructure.persistence;

import java.sql.SQLException;
import java.util.Optional;

public final class UniqueViolations {

	private static final int DUPLICATE_ENTRY = 1062;

	private UniqueViolations() {
	}

	public static boolean isUniqueViolation(Throwable error) {
		return find(error).isPresent();
	}

	public static boolean violates(Throwable error, String constraint) {
		return find(error).map(sql -> sql.getMessage() != null && sql.getMessage().contains(constraint))
				.orElse(false);
	}

	private static Optional<SQLException> find(Throwable error) {
		for (Throwable current = error; current != null; current = current.getCause()) {
			if (current instanceof SQLException sql && sql.getErrorCode() == DUPLICATE_ENTRY) {
				return Optional.of(sql);
			}
			if (current.getCause() == current) {
				return Optional.empty();
			}
		}
		return Optional.empty();
	}
}
