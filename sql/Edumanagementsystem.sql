--educational management system
--create user edumanagementsystem identified by xxxx; --xxxx密码 --创建用户并设置密码
--grant dba to edumanagementsystem;--给用户dba权限


--===========================区域管理================================
create table AREA  (
   AREA_ID              NUMBER(5)                          not null,
   AREA_CODE            VARCHAR2(30),
   AREA_NAME            VARCHAR2(30),
   constraint PK_AREA primary key (AREA_ID)
);

--create sequence area_seq;

-- area_id;      //区域ID
-- area_code;    //区域编码
-- area_name;    //区域名称
-- --List<Department>  department;//部门集合

--===========================部门管理==============================

create table DEPARTMENT  (
   DEPARTMENT_ID        NUMBER                          not null,
   AREA_ID              NUMBER,
   DEPARTMENT_NAME      VARCHAR2(20)                    not null,
   DEPARTMENT_DESCRIPTION VARCHAR2(50),
   constraint PK_APARTMENT primary key (DEPARTMENT_ID)
);

alter table DEPARTMENT
   add constraint FK_APARTMEN_REFERENCE_AREA foreign key (AREA_ID)
      references AREA (AREA_ID);
--create sequence department_seq;
--SELECT department_seq.nextval from dual;

-- department_id;                   // 部门ID
-- area_id;                         // 区域id
-- department_name;                 // 部门名称
-- department_description;          // 部门描述
-- --String area_name;                // 区域名称
-- --List<Position> position;         // 职称集合

--=============================职称表==============================

create table POSITION  (
   POSITION_ID          NUMBER                          not null,
   DEPARTMENT_ID        NUMBER,
   POSITION_NAME        VARCHAR2(20)                    not null,
   constraint PK_POSITION primary key (POSITION_ID)
);

alter table POSITION
   add constraint FK_POSITION_REFERENCE_APARTMEN foreign key (DEPARTMENT_ID)
      references DEPARTMENT (DEPARTMENT_ID);
      
--create sequence position_seq;
--SELECT position_seq.nextval from dual;

-- position_id;       // 职称ID
-- department_id;     //部门ID
-- position_name;     //职称名称
-- --area_id;           //区域id
-- --area_name;         //区域名称
-- --department_name;   //部门名称

--============================角色管理============================

create table ROLE  (
   ROLE_ID              NUMBER                          not null,
   ROLE_NAME            VARCHAR2(20),
   ROLE_STATE           CHAR(1),
   ROLE_DESCRIPTION     VARCHAR2(200),
   ROLE_CREATE_ADMIN    NUMBER,
   ROLE_CREATE_DATE     DATE,
   ROLE_UPDATE_ADMIN    NUMBER,
   ROLE_UPDATE_DATE     DATE,
   constraint PK_ROLE primary key (ROLE_ID)
);
--create sequence role_seq;

-- role_id;           // 角色ID
-- role_name;         // 角色名称
-- role_state;        // 角色状态（0代表有效，1代表无效）
-- role_description;  // 角色描述
-- role_create_admin; // 创建角色人的ID
-- role_create_date;  // 角色创建时间
-- role_update_admin; // 修改角色人的ID
-- role_update_date;  // 角色修改时间

--=============================员工表==============================
create table EMPLOYEE  (
   EMPLOYEE_ID          NUMBER                          not null,
   POSITION_ID          NUMBER,
   RESUME_ID            NUMBER,
   EMPLOYEE_NAME        VARCHAR2(10)                    not null,
   EMPLOYEE_LOGINNAME   VARCHAR2(30)                    not null,
   EMPLOYEE_PASSWORD    VARCHAR2(200)                   not null,
   EMPLOYEE_TEL         VARCHAR2(30),
   EMPLOYEE_WECHAT      VARCHAR2(20),
   EMPLOYEE_EMAIL       VARCHAR2(20),
   EMPLOYEE_QQ          VARCHAR2(20),
   EMPLOYEE_AREA        number,
   EMPLOYEE_STATUS      VARCHAR2(20),
   EMPLOYEE_ATTRIBUTE   VARCHAR2(20),
   EMPLOYEE_LEVEL       VARCHAR2(20),
   EMPLOYEE_BUSINESS    VARCHAR2(20),
   EMPLOYEE_CREATE_TIME DATE,
   EMPLOYEE_UPDATE_TIME DATE,
   EMPLOYEE_SEX         VARCHAR2(5),
   EMPLOYEE_CODE        VARCHAR2(40),
   EMPLOYEE_TECH        NUMBER,
   EMPLOYEE_NUM         NUMBER,
   EMPLOYEE_Dept        NUMBER,
   constraint PK_EMPLOYEE primary key (EMPLOYEE_ID)
);

alter table EMPLOYEE
   add constraint FK_EMPLOYEE_REFERENCE_POSITION foreign key (POSITION_ID)
      references POSITION (POSITION_ID);
      
--create sequence employee_seq;

-- employee_id;            // 员工ID
-- position_id;            // 职称ID
-- resume_id;              // 简历表ID
-- employee_name;          // 员工姓名
-- employee_loginname;     // 员工登录名
-- employee_password;      // 员工密码
-- employee_tel;           // 员工电话
-- employee_wechat;        // 员工微信
-- employee_email;         // 员工EMAIL
-- employee_qq;            // 员工QQ
-- employee_area;          // 员工所属地域
-- employee_status;        // 员工状态（0代表禁用，1代表可用，2代表闲置，3代表工作中）
-- employee_attribute;     // 员工性质（0代表全职，1代表兼职）
-- employee_level;         // 员工等级（0代表初级，1代表中级，2代表高级）
-- employee_business;      // 员工是否出差（0代表接受，1代表不接受）
-- employee_create_time;   // 员工信息的创建时间
-- employee_update_time;   // 员工信息的修改时间
-- employee_sex;           // 员工性别
-- employee_code;          // 员工地区编号
-- employee_tech;          // 员工技术方向ID
-- employee_num;           // 员工所带级班数量
-- employee_dept ;         // 员工所属部门
-- --area_name;              // 区域名称
-- --position_name;          // 职称名称
-- --department_name;        // 部门名称
-- --tech_tname;             // 技术方向
    
--============================权限表=============================
 
create table AUTHORITY  (
   AUTHORITY_ID         NUMBER                          not null,
   AUTHORITY_NAME       VARCHAR2(30),
   AUTHORITY_CODE       VARCHAR2(50),
   AUTHORITY_DESCRIPTION VARCHAR2(200),
   AUTHORITY_URL        VARCHAR2(100),
   AUTHORITY_LEVEL      CHAR(1),
   AUTHORITY_PARENT_ID  NUMBER(10),
   AUTHORITY_STATUS     CHAR(1),
   AUTHORITY_TYPE       CHAR(1),
   AUTHORITY_CREATE_DATE DATE,
   constraint PK_AUTHORITY primary key (AUTHORITY_ID)
);

-- AUTHORITY_ID;                   // 权限 ID
-- AUTHORITY_NAME;                 // 权限名称
-- AUTHORITY_CODE;                 // 权限编码
-- AUTHORITY_DESCRIPTION;          // 权限描述
-- AUTHORITY_URL;                  // 权限URL
-- AUTHORITY_LEVEL;                // 权限等级
-- AUTHORITY_PARENT_ID;            // 权限父ID
-- AUTHORITY_STATUS;               // 权限状态（0代表可用，1代表禁用）
-- AUTHORITY_TYPE;                 // 权限类型（0代表菜单，1代表按钮）
-- AUTHORITY_CREATE_DATE;          // 权限创建时间
-- --AUTHORITY_checked;            // 是否被选中


--=========================员工角色表==================================

create table EMPLOYEE_ROLE  (
   ROLE_ID              NUMBER,
   EMPLOYEE_ID          NUMBER
);

alter table EMPLOYEE_ROLE
   add constraint FK_EMPLOYEE_REFERENCE_EMPLOYEE foreign key (EMPLOYEE_ID)
      references EMPLOYEE (EMPLOYEE_ID);

alter table EMPLOYEE_ROLE
   add constraint FK_EMPLOYEE_REFERENCE_ROLE foreign key (ROLE_ID)
      references ROLE (ROLE_ID);
-- role_id;        //角色ID
-- employee_id;    //员工ID
      
--=========================角色权限表===================================

create table ROLE_AUTHORITY  (
   AUTHORITY_ID         NUMBER,
   ROLE_ID              NUMBER
);

alter table ROLE_AUTHORITY
   add constraint FK_ROLE_AUT_REFERENCE_AUTHORIT foreign key (AUTHORITY_ID)
      references AUTHORITY (AUTHORITY_ID);

alter table ROLE_AUTHORITY
   add constraint FK_ROLE_AUT_REFERENCE_ROLE foreign key (ROLE_ID)
      references ROLE (ROLE_ID);

-- AUTHORITY_ID;  //权限ID
-- ROLE_ID ;      //角色ID

--=========================技术方向=====================================

create table TECH  (
   TECH_ID              NUMBER                          not null,
   TECH_TNAME           VARCHAR2(30)                    not null,
   TECH_TIME            NUMBER                          not null,
   constraint PK_TECH primary key (TECH_ID)
);

-- tech_id; // 技术方向ID
-- tech_tname; // 技术方向名称
-- tech_time; // 该方向开班时间底线周数

--=============================教室=====================================
create table CLASSROOM  (
   CLASSROOM_CID        NUMBER                          not null,
   AREA_ID              NUMBER,
   CLASSROOM_CNAME      VARCHAR2(20)                    not null,
   CLASSROOM_CSTATUS    CHAR(1)                         not null,
   CLASSROOM_CPEONUMBER VARCHAR2(10)                    not null,
   constraint PK_CLASSROOM primary key (CLASSROOM_CID)
);

alter table CLASSROOM
   add constraint FK_CLASSROO_REFERENCE_AREA foreign key (AREA_ID)
      references AREA (AREA_ID);
--create sequence classroom_seq;
--select classroom_seq.nextval from dual;

-- classroom_cid; // 教室ID
-- area_id; // 区域名
-- classroom_cname; // 教室名
-- classroom_cstatus; // 教室状态（0代表空闲可用，1占用不可用）
-- classroom_cpeonumber; // 教室容纳人数

--========================开班=================================
create table STARTCLASS  (
   STARTCLASS_SID       NUMBER                          not null,
   TECH_ID              NUMBER,
   CLASSROOM_CID        NUMBER,
   STARTCLASS_SNO       VARCHAR2(25)                    not null,
   STARTCLASS_SPEONUMBER NUMBER,
   STARTCLASS_SSTARTTIME DATE,
   STARTCLASS_SENDTIME  DATE,
   STARTCLASS_TEACHER   NUMBER,
   STARTCLASS_TEAHINGASSIENT NUMBER,
   STARTCLASS_CLASSTUTOR NUMBER,
   STARTCLASS_SNATURE   VARCHAR2(10),
   STARTCLASS_SSTATUS   CHAR(1),
   STARTCLASS_SCHOOL    VARCHAR2(20),
   STARTCLASS_REGION    number,
   constraint PK_STARTCLASS primary key (STARTCLASS_SID)
);

alter table STARTCLASS
   add constraint FK_STARTCLA_REFERENCE_CLASSROO foreign key (CLASSROOM_CID)
      references CLASSROOM (CLASSROOM_CID);

alter table STARTCLASS
   add constraint FK_STARTCLA_REFERENCE_TECH foreign key (TECH_ID)
      references TECH (TECH_ID);
      
--create sequence startclass_seq;
--select startclass_seq.nextval from dual;

--startclass_sid;// 开班管理表ID
--tech_id;// 技术方向ID
--classroom_cid;// 教室ID
--startclass_sno;// 班级编号
--startclass_speonumber;// 班级人数
--startclass_sstarttime;// 开班时间
--startclass_sendtime;// 结束时间
--startclass_teacher;// 班主任
--startclass_teahingassient;// 助教
--startclass_classtutor;// 讲师
--startclass_snature;// 班级性质
--startclass_sstatus;// 班级状态 
--startclass_school;// 学校信息
--startclass_region;// 开班地域

--===========================班级课程表==========================
create table CLASSCOURSE  (
   CLASSCOURSE_ID       NUMBER                          not null,
   STARTCLASS_SID       NUMBER,
   CLASSCOURSE_STARTTIME DATE,
   CLASSCOURSE_ENDTIME  DATE,
   CLASSCOURSE_NAME     VARCHAR2(30),
   constraint PK_CLASSCOURSE primary key (CLASSCOURSE_ID)
);

alter table CLASSCOURSE
   add constraint FK_CLASSCOU_REFERENCE_STARTCLA foreign key (STARTCLASS_SID)
      references STARTCLASS (STARTCLASS_SID);
      
--create sequence classcourse_seq;
--select classcourse_seq.nextval from dual;

--classcourse_id;// 班级课程表id
--startclass_sid;// 开班管理表id
--classcourse_starttime;// 课程（周）开始时间
--classcourse_endtime;// 课程（周）结束时间
--classcourse_name;// 班级课程名称

--===========================课程体系表===========================
create table COURSESYS  (
   COURSESYS_CSID       NUMBER                          not null,
   COURSESYS_CSNAME     VARCHAR2(100)                   not null,
   TECH_ID              NUMBER                          not null,
   COURSESYS_SYSTEMPATH VARCHAR2(400),
   constraint PK_COURSESYS primary key (COURSESYS_CSID)
);

alter table COURSESYS
   add constraint FK_COURSESY_REFERENCE_TECH foreign key (TECH_ID)
      references TECH (TECH_ID);
      
--create sequence coursesys_seq;
--select coursesys_seq.nextval from dual;

--coursesys_csid;// 课程体系编号
--coursesys_csname;// 课程体系名称
--tech_id;// 技术方向id
--coursesys_systempath;// 排序字段

--===========================员工简历表===========================
create table RESUME  (
   RESUME_ID            NUMBER                          not null,
   EMPLOYEE_ID          NUMBER,
   RESUME_EXPREIENCE    VARCHAR2(255),
   RESUME_SCHOOL        VARCHAR2(25),
   RESUME_DATE          DATE,
   RESUME_PROFESSIONAL  VARCHAR2(20),
   constraint PK_RESUME primary key (RESUME_ID)
);

alter table RESUME
   add constraint FK_RESUME_REFERENCE_EMPLOYEE foreign key (EMPLOYEE_ID)
      references EMPLOYEE (EMPLOYEE_ID);

--resume_id;// 简历id
--employee_id;// 员工id
--resume_expreience;// 工作经验
--resume_school;// 毕业学校
--resume_date;// 毕业日期
--resume_professional;// 专业

-- =========================员工统计图表===========================
create table employeeview(
label varchar2(20),
value varchar2(20)
);
