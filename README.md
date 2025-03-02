# API Authentication Documentation

## Overview
Dokumentasi ini menjelaskan API yang digunakan untuk autentikasi pengguna serta pengelolaan data pada tabel `user` dan `post` dengan tema anime. Setelah login, pengguna dapat membuat postingan anime, yang kemudian akan ditampilkan di halaman profil pengguna.

## Database Schema

### 1. Tabel `user`
| Column     | Type         | Description                  |
|------------|------------|------------------------------|
| id         | INT (AUTO_INCREMENT, PRIMARY KEY) | ID unik pengguna |
| username   | VARCHAR(255) | Nama pengguna |
| email      | VARCHAR(255) | Email pengguna |
| password   | VARCHAR(255) | Password yang telah di-hash |
| created_at | TIMESTAMP   | Waktu pembuatan akun |

### 2. Tabel `post` (Tema Anime)
| Column     | Type         | Description                  |
|------------|------------|------------------------------|
| id         | INT (AUTO_INCREMENT, PRIMARY KEY) | ID unik postingan |
| user_id    | INT         | ID pengguna yang membuat postingan |
| anime_title | VARCHAR(255) | Judul anime yang dibahas |
| review     | TEXT        | Ulasan tentang anime |
| rating     | INT         | Peringkat anime (1-10) |
| created_at | TIMESTAMP   | Waktu pembuatan postingan |

## API Endpoints

### 1. Register User
**Endpoint:** `POST /api/register`

**Request Body:**
```json
{
  "username": "example_user",
  "email": "user@example.com",
  "password": "securepassword"
}
```

**Response:**
```json
{
  "status": "success",
  "message": "User registered successfully"
}
```

### 2. Login User
**Endpoint:** `POST /api/login`

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "securepassword"
}
```

**Response:**
```json
{
  "status": "success",
  "token": "your_jwt_token"
}
```

### 3. Get User Profile
**Endpoint:** `GET /api/user`

**Headers:**
```
Authorization: Bearer your_jwt_token
```

**Response:**
```json
{
  "id": 1,
  "username": "example_user",
  "email": "user@example.com",
  "created_at": "2025-03-02 12:00:00"
}
```

### 4. Create Anime Post
**Endpoint:** `POST /api/post`

**Headers:**
```
Authorization: Bearer your_jwt_token
```

**Request Body:**
```json
{
  "anime_title": "Hibike Euphonium",
  "review": "Akiramerunowa saigo made ippai ganbatte kara nishite kudasai!",
  "rating": 10
}
```

**Response:**
```json
{
  "status": "success",
  "message": "Anime post created successfully"
}
```

### 5. Get All Anime Posts
**Endpoint:** `GET /api/posts`

**Response:**
```json
[
  {
    "id": 1,
    "user_id": 1,
    "anime_title": "Hibike Euphonium",
    "review": "Akiramerunowa saigo made ippai ganbatte kara nishite kudasai!",
    "rating": 10,
    "created_at": "2025-03-02 12:30:00"
  }
]
```

### 6. Get User Posts
**Endpoint:** `GET /api/user/posts`

**Headers:**
```
Authorization: Bearer your_jwt_token
```

**Response:**
```json
[
  {
    "id": 1,
    "anime_title": "Hibike Euphonium",
    "review": "Akiramerunowa saigo made ippai ganbatte kara nishite kudasai!",
    "rating": 10,
    "created_at": "2025-03-02 12:30:00"
  }
]
```

## Authentication & Security
- Password pengguna dienkripsi menggunakan bcrypt.
- JWT (JSON Web Token) digunakan untuk autentikasi pengguna.
- Semua endpoint yang membutuhkan autentikasi harus menyertakan token dalam header `Authorization`.

## Notes
- Endpoint dapat diperluas untuk fitur tambahan seperti update profil, hapus postingan, dsb.
- Pastikan API ini menggunakan HTTPS untuk keamanan data.
- Pengguna hanya dapat melihat postingan yang mereka buat di halaman profil mereka sendiri.
