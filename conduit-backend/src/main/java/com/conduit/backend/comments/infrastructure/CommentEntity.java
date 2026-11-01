package com.conduit.backend.comments.infrastructure;

import com.conduit.backend.comments.domain.Comment;
import com.conduit.backend.comments.domain.CommentBody;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.Instant;
import java.util.UUID;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

@Entity
@Table(name = "comments")
public class CommentEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, updatable = false)
	private Long id;

	@JdbcTypeCode(SqlTypes.CHAR)
	@Column(name = "article_id", nullable = false, updatable = false, length = 36)
	private UUID articleId;

	@JdbcTypeCode(SqlTypes.CHAR)
	@Column(name = "author_id", nullable = false, updatable = false, length = 36)
	private UUID authorId;

	@Column(name = "body", nullable = false)
	private String body;

	@Column(name = "created_at", nullable = false, updatable = false)
	private Instant createdAt;

	@Column(name = "updated_at", nullable = false)
	private Instant updatedAt;

	protected CommentEntity() {
	}

	static CommentEntity from(Comment comment) {
		CommentEntity entity = new CommentEntity();
		entity.articleId = comment.getArticleId();
		entity.authorId = comment.getAuthorId();
		entity.body = comment.getBody().value();
		entity.createdAt = comment.getCreatedAt();
		entity.updatedAt = comment.getUpdatedAt();
		return entity;
	}

	UUID getAuthorId() {
		return authorId;
	}

	Comment toDomain() {
		return Comment.restore(id, articleId, authorId, CommentBody.restore(body), createdAt, updatedAt);
	}
}
