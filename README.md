# Lab Work #7 — Backend API

**Course:** Web Application Development  
**Year of Study:** 2 | **Semester:** 1 | **Year:** 2024

**Author:** Maksym Poliukhovych

---

## Description

ASP.NET Core 8 minimal REST API that serves as the server-side log storage for Lab #7. The frontend posts animation events here as they occur; on session close it fetches all saved records, compares them with `localStorage`, then clears the server storage.

**Frontend Repository:** [Marshmalllows/web-lab7](https://github.com/Marshmalllows/web-lab7)  
**Live API Base URL:** `https://web-api-7.onrender.com`

---

## Endpoints

| Method | Path        | Body / Response | Description |
|--------|-------------|-----------------|-------------|
| `POST` | `/api/save` | `{ "id": "1", "message": "..." }` → `{ "message": "Record saved" }` | Appends a timestamped record to in-memory storage |
| `GET`  | `/api/get`  | → `[{ "id": "1", "message": "..." }, ...]` | Returns all records sorted by `id`, then clears storage |

### Record schema

```json
{
  "id": "string",      // sequential integer as string
  "message": "string"  // event description; server prepends current timestamp
}
```

Error responses return HTTP 400 with `{ "message": "..." }`.

---

## CORS

Only `https://marshmalllows.github.io` is allowed. All methods and headers are permitted for that origin.

---

## Running Locally

**Prerequisites:** .NET 8 SDK

```bash
dotnet run --project web7
```

Swagger UI is available at `/swagger` in the Development environment.

---

## Running with Docker

```bash
docker build -t web7api .
docker run -p 8080:8080 web7api
```

---

## Tech Stack

- ASP.NET Core 8 (minimal hosting model)
- In-memory storage (static `List<Record>`)
- Swagger / Swashbuckle (dev only)
- Docker (multi-stage build, `mcr.microsoft.com/dotnet/aspnet:8.0`)
