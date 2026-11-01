CREATE TABLE users (
  id            CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  username      VARCHAR(50)   CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  email         VARCHAR(254)  CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  password_hash VARCHAR(255)  NOT NULL,
  bio           TEXT,
  image         VARCHAR(2048),
  created_at    DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  updated_at    DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX users_email_unique    ON users ((lower(email)));
CREATE UNIQUE INDEX users_username_unique ON users ((lower(username)));
