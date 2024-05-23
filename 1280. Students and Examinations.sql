SELECT st.student_id, st.student_name, sj.subject_name, COUNT(ex.student_id) attended_exams
FROM Students st CROSS JOIN Subjects sj
    LEFT JOIN Examinations ex ON st.student_id = ex.student_id AND ex.subject_name = sj.subject_name
GROUP BY st.student_id, st.student_name, sj.subject_name
ORDER BY st.student_id, sj.subject_name
