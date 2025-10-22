-- Students table
CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(100),
    marks NUMBER(3),
    grade CHAR(2)
);

-- Student audit table
CREATE TABLE student_audit (
    audit_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id NUMBER,
    old_marks NUMBER,
    new_marks NUMBER,
    old_grade CHAR(2),
    new_grade CHAR(2),
    change_date DATE DEFAULT SYSDATE
);
CREATE OR REPLACE TRIGGER trg_student_grade_audit
AFTER INSERT OR UPDATE ON students
FOR EACH ROW
DECLARE
    v_old_grade CHAR(2);
    v_new_grade CHAR(2);
BEGIN
    -- Assign grade based on marks
    IF :NEW.marks >= 90 THEN
        v_new_grade := 'A';
    ELSIF :NEW.marks >= 75 THEN
        v_new_grade := 'B';
    ELSIF :NEW.marks >= 60 THEN
        v_new_grade := 'C';
    ELSIF :NEW.marks >= 50 THEN
        v_new_grade := 'D';
    ELSE
        v_new_grade := 'F';
    END IF;

    -- Update grade in students table
    UPDATE students
    SET grade = v_new_grade
    WHERE student_id = :NEW.student_id;

    -- Capture old grade if update
    IF UPDATING THEN
        v_old_grade := :OLD.grade;
    ELSE
        v_old_grade := NULL;
    END IF;

    -- Insert into audit table
    INSERT INTO student_audit (
        student_id, old_marks, new_marks, old_grade, new_grade
    )
    VALUES (
        :NEW.student_id,
        :OLD.marks,
        :NEW.marks,
        v_old_grade,
        v_new_grade
    );
END;
/
SHOW ERRORS;
-- Enable DBMS output
SET SERVEROUTPUT ON;

-- Insert students
INSERT INTO students (student_id, student_name, marks) VALUES (1, 'Naveen', 92);
INSERT INTO students (student_id, student_name, marks) VALUES (2, 'Anjali', 78);
INSERT INTO students (student_id, student_name, marks) VALUES (3, 'Rahul', 63);
INSERT INTO students (student_id, student_name, marks) VALUES (4, 'Sneha', 49);
COMMIT;
select * from student_audit;


