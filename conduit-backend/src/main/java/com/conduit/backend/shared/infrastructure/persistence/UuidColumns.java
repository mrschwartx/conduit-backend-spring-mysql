package com.conduit.backend.shared.infrastructure.persistence;

import java.util.Collection;
import java.util.List;
import java.util.UUID;

public final class UuidColumns {

	public static final UUID NIL = new UUID(0L, 0L);

	private UuidColumns() {
	}

	public static String text(UUID id) {
		return id.toString();
	}

	public static List<String> texts(Collection<UUID> ids) {
		return ids.stream().map(UuidColumns::text).toList();
	}

	public static UUID read(Object value) {
		if (value instanceof UUID id) {
			return id;
		}
		if (value instanceof CharSequence text) {
			return UUID.fromString(text.toString());
		}
		throw new IllegalStateException("Unsupported UUID column value: " + value);
	}

	public static List<UUID> readAll(Collection<?> values) {
		return values.stream().map(UuidColumns::read).toList();
	}
}
