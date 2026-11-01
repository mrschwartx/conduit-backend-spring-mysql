CREATE TABLE favorites (
  user_id    CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  article_id CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (user_id, article_id),
  CONSTRAINT favorites_user_fk FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  CONSTRAINT favorites_article_fk FOREIGN KEY (article_id) REFERENCES articles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE INDEX favorites_article ON favorites (article_id);
