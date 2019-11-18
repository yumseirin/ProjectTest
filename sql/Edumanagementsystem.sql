--educational management system
--create user edumanagementsystem identified by xxxx; --xxxx���� --�����û�����������
--grant dba to edumanagementsystem;--���û�dbaȨ��


--===========================�������================================
create table AREA  (
   AREA_ID              NUMBER(5)                          not null,
   AREA_CODE            VARCHAR2(30),
   AREA_NAME            VARCHAR2(30),
   constraint PK_AREA primary key (AREA_ID)
);

--create sequence area_seq;

-- area_id;      //����ID
-- area_code;    //�������
-- area_name;    //��������
-- --List<Department>  department;//���ż���

--===========================���Ź���==============================

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

-- department_id;                   // ����ID
-- area_id;                         // ����id
-- department_name;                 // ��������
-- department_description;          // ��������
-- --String area_name;                // ��������
-- --List<Position> position;         // ְ�Ƽ���

--=============================ְ�Ʊ�==============================

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

-- position_id;       // ְ��ID
-- department_id;     //����ID
-- position_name;     //ְ������
-- --area_id;           //����id
-- --area_name;         //��������
-- --department_name;   //��������

--============================��ɫ����============================

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

-- role_id;           // ��ɫID
-- role_name;         // ��ɫ����
-- role_state;        // ��ɫ״̬��0������Ч��1������Ч��
-- role_description;  // ��ɫ����
-- role_create_admin; // ������ɫ�˵�ID
-- role_create_date;  // ��ɫ����ʱ��
-- role_update_admin; // �޸Ľ�ɫ�˵�ID
-- role_update_date;  // ��ɫ�޸�ʱ��

--=============================Ա����==============================
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

-- employee_id;            // Ա��ID
-- position_id;            // ְ��ID
-- resume_id;              // ������ID
-- employee_name;          // Ա������
-- employee_loginname;     // Ա����¼��
-- employee_password;      // Ա������
-- employee_tel;           // Ա���绰
-- employee_wechat;        // Ա��΢��
-- employee_email;         // Ա��EMAIL
-- employee_qq;            // Ա��QQ
-- employee_area;          // Ա����������
-- employee_status;        // Ա��״̬��0������ã�1������ã�2�������ã�3�������У�
-- employee_attribute;     // Ա�����ʣ�0����ȫְ��1�����ְ��
-- employee_level;         // Ա���ȼ���0���������1�����м���2����߼���
-- employee_business;      // Ա���Ƿ���0������ܣ�1�������ܣ�
-- employee_create_time;   // Ա����Ϣ�Ĵ���ʱ��
-- employee_update_time;   // Ա����Ϣ���޸�ʱ��
-- employee_sex;           // Ա���Ա�
-- employee_code;          // Ա���������
-- employee_tech;          // Ա����������ID
-- employee_num;           // Ա��������������
-- employee_dept ;         // Ա����������
-- --area_name;              // ��������
-- --position_name;          // ְ������
-- --department_name;        // ��������
-- --tech_tname;             // ��������
    
--============================Ȩ�ޱ�=============================
 
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

-- AUTHORITY_ID;                   // Ȩ�� ID
-- AUTHORITY_NAME;                 // Ȩ������
-- AUTHORITY_CODE;                 // Ȩ�ޱ���
-- AUTHORITY_DESCRIPTION;          // Ȩ������
-- AUTHORITY_URL;                  // Ȩ��URL
-- AUTHORITY_LEVEL;                // Ȩ�޵ȼ�
-- AUTHORITY_PARENT_ID;            // Ȩ�޸�ID
-- AUTHORITY_STATUS;               // Ȩ��״̬��0������ã�1������ã�
-- AUTHORITY_TYPE;                 // Ȩ�����ͣ�0����˵���1����ť��
-- AUTHORITY_CREATE_DATE;          // Ȩ�޴���ʱ��
-- --AUTHORITY_checked;            // �Ƿ�ѡ��


--=========================Ա����ɫ��==================================

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
-- role_id;        //��ɫID
-- employee_id;    //Ա��ID
      
--=========================��ɫȨ�ޱ�===================================

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

-- AUTHORITY_ID;  //Ȩ��ID
-- ROLE_ID ;      //��ɫID

--=========================��������=====================================

create table TECH  (
   TECH_ID              NUMBER                          not null,
   TECH_TNAME           VARCHAR2(30)                    not null,
   TECH_TIME            NUMBER                          not null,
   constraint PK_TECH primary key (TECH_ID)
);

-- tech_id; // ��������ID
-- tech_tname; // ������������
-- tech_time; // �÷��򿪰�ʱ���������

--=============================����=====================================
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

-- classroom_cid; // ����ID
-- area_id; // ������
-- classroom_cname; // ������
-- classroom_cstatus; // ����״̬��0������п��ã�1ռ�ò����ã�
-- classroom_cpeonumber; // ������������

--========================����=================================
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

--startclass_sid;// ��������ID
--tech_id;// ��������ID
--classroom_cid;// ����ID
--startclass_sno;// �༶���
--startclass_speonumber;// �༶����
--startclass_sstarttime;// ����ʱ��
--startclass_sendtime;// ����ʱ��
--startclass_teacher;// ������
--startclass_teahingassient;// ����
--startclass_classtutor;// ��ʦ
--startclass_snature;// �༶����
--startclass_sstatus;// �༶״̬ 
--startclass_school;// ѧУ��Ϣ
--startclass_region;// �������

--===========================�༶�γ̱�==========================
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

--classcourse_id;// �༶�γ̱�id
--startclass_sid;// ��������id
--classcourse_starttime;// �γ̣��ܣ���ʼʱ��
--classcourse_endtime;// �γ̣��ܣ�����ʱ��
--classcourse_name;// �༶�γ�����

--===========================�γ���ϵ��===========================
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

--coursesys_csid;// �γ���ϵ���
--coursesys_csname;// �γ���ϵ����
--tech_id;// ��������id
--coursesys_systempath;// �����ֶ�

--===========================Ա��������===========================
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

--resume_id;// ����id
--employee_id;// Ա��id
--resume_expreience;// ��������
--resume_school;// ��ҵѧУ
--resume_date;// ��ҵ����
--resume_professional;// רҵ

-- =========================Ա��ͳ��ͼ��===========================
create table employeeview(
label varchar2(20),
value varchar2(20)
);
