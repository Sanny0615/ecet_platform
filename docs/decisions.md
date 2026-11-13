# Project Decisions

## Initial Decisions

- Backend: FastAPI
- Frontend: HTML, CSS, and later React
- Version Control: Git and GitHub


# Day 3 — PostgreSQL Decisions

## 1. Foreign Key Violation

**Experiment:** Inserted a topic with subject_id = 999.

**Error:** Foreign key constraint violation.

**Reason:** Subject ID 999 does not exist in the subjects table.

**Learning:** Foreign keys maintain referential integrity.

## 2. Unique Constraint Violation

**Experiment:** Inserted Java into subjects again.

**Error:** Duplicate key violates unique constraint.

**Reason:** Java already exists, and the name column has a UNIQUE constraint.

**Learning:** UNIQUE prevents duplicate values.

## 3. NOT NULL Constraint Violation

**Experiment:** Inserted a subject with NULL name.

**Error:** Not-null constraint violation.

**Reason:** The name column does not accept NULL values.

**Learning:** NOT NULL ensures required data is provided.

## 4. Foreign Key Delete Restriction

**Experiment:** Tried deleting Java while its topics still referenced it.

**Error:** Foreign key violation.

**Reason:** Existing topic records still reference subject ID 1.

**Learning:** PostgreSQL protects referenced records from accidental deletion.
