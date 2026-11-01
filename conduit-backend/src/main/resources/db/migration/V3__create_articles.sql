CREATE TABLE articles (
  id          CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  author_id   CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  slug        VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  title       VARCHAR(255) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  body        MEDIUMTEXT NOT NULL,
  created_at  DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  updated_at  DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (id),
  CONSTRAINT articles_author_fk FOREIGN KEY (author_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX articles_slug_unique ON articles (slug);
CREATE INDEX articles_author_created ON articles (author_id, created_at DESC);
CREATE INDEX articles_created ON articles (created_at DESC, id DESC);

CREATE TABLE article_tags (
  article_id CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  tag        VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `position` SMALLINT NOT NULL,
  PRIMARY KEY (article_id, tag),
  CONSTRAINT article_tags_article_fk FOREIGN KEY (article_id) REFERENCES articles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE INDEX article_tags_tag ON article_tags (tag);
