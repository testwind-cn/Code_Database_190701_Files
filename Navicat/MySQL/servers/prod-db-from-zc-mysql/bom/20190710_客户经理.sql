
SELECT distinct( mgr_id ) u_id from loan.t_loan_credit_mgr order by u_id desc;
-- 2060



-- 6313条，没有重复，正常数据（未归档删除），包括：正常、停用、注销
SELECT bbb.u_id, aaa.*
from (
	SELECT	distinct( mgr_id ) u_id 
	from loan.t_loan_credit_mgr 
) bbb
LEFT JOIN (
    SELECT
        *
    from bom.t_operation_emp
    where
        bom.t_operation_emp.`ARCHIVE_FLAG` = 1
        and
        bom.t_operation_emp.`STATUS` in ('1','2','9')
) aaa
on bbb.u_id=aaa.email





create function myselect5(name varchar(15)) returns int
begin 
    declare c int;
		set c=15;
    return c;
end;

SELECT myselect5('sds') from dual;



-- 1914个认证成功的客户经理
SELECT distinct user_id from (
SELECT * from t_operation_emp_bank where STATE=1
) aaa ;


-- 银行卡认证信息
-- 1841个用户一次认证成功， STATE=1 表示成功
-- 154 条是认证2次以上的,73个人，认证了154次
SELECT * from t_operation_emp_bank
LEFT JOIN (
	SELECT count(*) nn ,USER_ID from t_operation_emp_bank GROUP BY	USER_ID having count(*) > 1 ORDER BY nn desc
) aaa
on t_operation_emp_bank.USER_ID = aaa.USER_ID
where aaa.USER_ID is not null
ORDER BY t_operation_emp_bank.USER_ID;
