CREATE TABLE follows (
  follower_id CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  followee_id CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  created_at  DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (follower_id, followee_id),
  CONSTRAINT follows_follower_fk FOREIGN KEY (follower_id) REFERENCES users (id) ON DELETE CASCADE,
  CONSTRAINT follows_followee_fk FOREIGN KEY (followee_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE INDEX follows_followee ON follows (followee_id);
