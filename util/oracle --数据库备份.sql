------------------------------------------------
-- Export file for user MC                    --
-- Created by liruimin on 2015/9/18, 16:09:21 --
------------------------------------------------

spool 333.log

prompt
prompt Creating table ADDRESS_GROUP_INFO
prompt =================================
prompt
create table mc.ADDRESS_GROUP_INFO
(
  group_id        VARCHAR2(50) not null,
  group_name      VARCHAR2(30),
  group_remark    VARCHAR2(200),
  create_user_id  VARCHAR2(200),
  organization_id VARCHAR2(200),
  create_time     DATE default sysdate,
  modify_time     DATE default sysdate
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ADDRESS_GROUP_INFO
  add primary key (GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ADDRESS_BOOK_INFO
prompt ================================
prompt
create table mc.ADDRESS_BOOK_INFO
(
  id              VARCHAR2(50) not null,
  name            VARCHAR2(30),
  phone_number    VARCHAR2(20),
  position        VARCHAR2(20),
  birthday        DATE,
  email           VARCHAR2(50),
  remark          VARCHAR2(200),
  organization_id VARCHAR2(200),
  create_user_id  VARCHAR2(200),
  create_time     DATE default sysdate,
  modify_time     DATE,
  group_id        VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ADDRESS_BOOK_INFO
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ADDRESS_BOOK_INFO
  add constraint FK7309B5999E4DF9FB foreign key (GROUP_ID)
  references mc.ADDRESS_GROUP_INFO (GROUP_ID);

prompt
prompt Creating table BIG_BLACK_MOBILE
prompt ===============================
prompt
create table mc.BIG_BLACK_MOBILE
(
  big_blackid   VARCHAR2(200) not null,
  black_channel VARCHAR2(200),
  black_enabled NUMBER(10),
  remark        VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.BIG_BLACK_MOBILE
  add primary key (BIG_BLACKID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table BLACK
prompt ====================
prompt
create table mc.BLACK
(
  black_id     VARCHAR2(50) not null,
  black_mobile VARCHAR2(20),
  black_desc   VARCHAR2(100),
  black_time   DATE,
  black_type   VARCHAR2(20),
  group_id     VARCHAR2(200),
  oper_userid  VARCHAR2(50),
  oper_orgid   VARCHAR2(50),
  sys_id       VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.BLACK
  add primary key (BLACK_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BLACK_CONFIG
prompt ===========================
prompt
create table mc.BLACK_CONFIG
(
  config_key   VARCHAR2(200) not null,
  config_value VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.BLACK_CONFIG
  add constraint PK_BLACK_CONFIG primary key (CONFIG_KEY)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table BLACK_CSMD
prompt =========================
prompt
create table mc.BLACK_CSMD
(
  black_mobilie VARCHAR2(20) not null,
  black_time    DATE,
  black_desc    VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 10M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.BLACK_CSMD
  is '???????';
alter table mc.BLACK_CSMD
  add constraint PK_BLACK_CSMD primary key (BLACK_MOBILIE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 17M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BLACK_LOG
prompt ========================
prompt
create table mc.BLACK_LOG
(
  black_log_id      VARCHAR2(200) not null,
  operate_user_id   VARCHAR2(200),
  operate_org_id    VARCHAR2(200),
  operate_type      VARCHAR2(20),
  mobile            VARCHAR2(255),
  remark            VARCHAR2(255),
  operate_time      DATE,
  operate_user_name VARCHAR2(255),
  operate_org_name  VARCHAR2(255),
  black_id          VARCHAR2(50),
  black_mobile      VARCHAR2(20),
  black_desc        VARCHAR2(100),
  log_time          DATE,
  operation         VARCHAR2(50),
  oper_user         VARCHAR2(200),
  sys_id            VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.BLACK_LOG
  add primary key (BLACK_LOG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_CFG_META_DATA
prompt ====================================
prompt
create table mc.CHANNEL_CFG_META_DATA
(
  link_mode            VARCHAR2(50) not null,
  message_type         VARCHAR2(50),
  param_name           VARCHAR2(50) not null,
  param_short_name     VARCHAR2(50),
  param_data_type      VARCHAR2(50),
  param_data_unit_type VARCHAR2(50),
  param_data_scope     VARCHAR2(50),
  param_data_reg_exp   VARCHAR2(1000),
  param_data_hint      VARCHAR2(200),
  param_default_value  VARCHAR2(200),
  param_description    VARCHAR2(2000),
  hidden_me            NUMBER(2),
  relation_field       VARCHAR2(50),
  display_index        NUMBER(2),
  tag_name             VARCHAR2(50),
  required             NUMBER(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.CHANNEL_CFG_META_DATA
  is '����ͨ������Ԫ���ݱ�';
comment on column mc.CHANNEL_CFG_META_DATA.link_mode
  is '��������';
comment on column mc.CHANNEL_CFG_META_DATA.message_type
  is '��Ϣ����, SMS-����, MMS-����';
comment on column mc.CHANNEL_CFG_META_DATA.param_name
  is '��������';
comment on column mc.CHANNEL_CFG_META_DATA.param_short_name
  is '������������';
comment on column mc.CHANNEL_CFG_META_DATA.param_data_type
  is '��������������';
comment on column mc.CHANNEL_CFG_META_DATA.param_data_unit_type
  is '��λ';
comment on column mc.CHANNEL_CFG_META_DATA.param_data_scope
  is '������ֵ��,���鷽ʽ, REGEXP:������ʽ, JS:javascript, ENUM:�б�ö��';
comment on column mc.CHANNEL_CFG_META_DATA.param_data_reg_exp
  is '������ֵ���������ʽ';
comment on column mc.CHANNEL_CFG_META_DATA.param_data_hint
  is '������ʾ';
comment on column mc.CHANNEL_CFG_META_DATA.param_default_value
  is '������ȱʡֵ';
comment on column mc.CHANNEL_CFG_META_DATA.param_description
  is '������˵��';
comment on column mc.CHANNEL_CFG_META_DATA.hidden_me
  is '�Ƿ���ʾ';
comment on column mc.CHANNEL_CFG_META_DATA.relation_field
  is '��ҵ�����ݵ��ĸ��ֶ�ȡֵ';
comment on column mc.CHANNEL_CFG_META_DATA.display_index
  is '������˵��';
comment on column mc.CHANNEL_CFG_META_DATA.tag_name
  is '�˲���Ӧ�õ��ĸ������ļ�';
comment on column mc.CHANNEL_CFG_META_DATA.required
  is '����';
alter table mc.CHANNEL_CFG_META_DATA
  add constraint PK_CHANNEL_CFG_META_DATA primary key (LINK_MODE, PARAM_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_CHECK_CONFIG
prompt ===================================
prompt
create table mc.CHANNEL_CHECK_CONFIG
(
  channel_id               NUMBER(4) not null,
  channel_name             VARCHAR2(200),
  backup_channel_id        NUMBER(4),
  backup_channel_name      VARCHAR2(200),
  backup_mobile_channel_id NUMBER(4),
  backup_union_channel_id  NUMBER(4),
  backup_dx_channel_id     NUMBER(4),
  check_frequence          NUMBER(10),
  fault_report_delay       NUMBER(10),
  check_type               VARCHAR2(20),
  status                   VARCHAR2(20),
  max_switch_quantity      NUMBER(10),
  min_sms_thredhold        NUMBER(10),
  max_sms_thredhold        NUMBER(10),
  send_rate                NUMBER(10),
  max_delay_minute         NUMBER(10),
  do_send_sms_alarm        VARCHAR2(20),
  do_send_email_alarm      VARCHAR2(20),
  sms_alarm_templat        VARCHAR2(20),
  email_alarm_template     VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.CHANNEL_CHECK_CONFIG
  is 'ͨ���л�����';
comment on column mc.CHANNEL_CHECK_CONFIG.channel_id
  is 'ͨ�����';
comment on column mc.CHANNEL_CHECK_CONFIG.channel_name
  is 'ͨ������';
comment on column mc.CHANNEL_CHECK_CONFIG.backup_channel_id
  is '����ͨ�����';
comment on column mc.CHANNEL_CHECK_CONFIG.backup_channel_name
  is '����ͨ������';
comment on column mc.CHANNEL_CHECK_CONFIG.backup_mobile_channel_id
  is '�ƶ�����ͨ�����';
comment on column mc.CHANNEL_CHECK_CONFIG.backup_union_channel_id
  is '��ͨ����ͨ�����';
comment on column mc.CHANNEL_CHECK_CONFIG.backup_dx_channel_id
  is '���ű���ͨ�����';
comment on column mc.CHANNEL_CHECK_CONFIG.check_frequence
  is '���Ƶ��, ��λ:��';
comment on column mc.CHANNEL_CHECK_CONFIG.fault_report_delay
  is '���ϱ����ӳ�ʱ��, ��λ:��, Ϊ������, ������������ʱ����ٱ���,Ȼ���ȡ��ʩ';
comment on column mc.CHANNEL_CHECK_CONFIG.check_type
  is '��������, QUANTITY:���ѻ����ż��, TIME:����ʱЧ���';
comment on column mc.CHANNEL_CHECK_CONFIG.status
  is '״̬, Y:��Ч,N:δ��Ч';
comment on column mc.CHANNEL_CHECK_CONFIG.max_switch_quantity
  is '����л�����';
comment on column mc.CHANNEL_CHECK_CONFIG.min_sms_thredhold
  is '��ѹ���ŵ���С��ֵ, �����������������ڸ�ֵʱ, ����ͨ��������';
comment on column mc.CHANNEL_CHECK_CONFIG.max_sms_thredhold
  is '��ѹ���ŵ����ֵ, �����������������ڸ�ֵʱ, ��Ҫ�л�ͨ��';
comment on column mc.CHANNEL_CHECK_CONFIG.send_rate
  is '���ŵķ����ٶ�, ��λ:��/��';
comment on column mc.CHANNEL_CHECK_CONFIG.max_delay_minute
  is '��ӳ�ʱ��, ��λ:����';
comment on column mc.CHANNEL_CHECK_CONFIG.do_send_sms_alarm
  is '�Ƿ��Ͷ��Ÿ澯, Y:����, N:������';
comment on column mc.CHANNEL_CHECK_CONFIG.do_send_email_alarm
  is '�Ƿ����ʼ��澯, Y:����, N:������';
comment on column mc.CHANNEL_CHECK_CONFIG.sms_alarm_templat
  is '���Ÿ澯ģ��';
comment on column mc.CHANNEL_CHECK_CONFIG.email_alarm_template
  is '�ʼ��澯ģ��';
alter table mc.CHANNEL_CHECK_CONFIG
  add constraint PK_CHANNEL_CHECK_CONFIG primary key (CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CHANNEL_CONSOLE_CONFIG
prompt =====================================
prompt
create table mc.CHANNEL_CONSOLE_CONFIG
(
  channel_type   VARCHAR2(20) not null,
  status         VARCHAR2(20),
  check_interval NUMBER(4)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.CHANNEL_CONSOLE_CONFIG
  is 'ͨ���������';
comment on column mc.CHANNEL_CONSOLE_CONFIG.channel_type
  is 'ͨ������, SMS:����, MMS:����';
comment on column mc.CHANNEL_CONSOLE_CONFIG.status
  is '״̬, N:������, Y:����';
comment on column mc.CHANNEL_CONSOLE_CONFIG.check_interval
  is '������, ��λ:��';
alter table mc.CHANNEL_CONSOLE_CONFIG
  add constraint PK_CHANNEL_CONSOLE_CONFIG primary key (CHANNEL_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_INFO
prompt ===========================
prompt
create table mc.CHANNEL_INFO
(
  channel_id             NUMBER(4) not null,
  channel_name           VARCHAR2(500),
  sp_no_lt               VARCHAR2(50),
  sp_no_yd               VARCHAR2(50),
  sp_no_dx               VARCHAR2(50),
  channel_status         NUMBER(1) default 0,
  channel_clz            VARCHAR2(2000),
  channel_remark         VARCHAR2(2000),
  sort_id                NUMBER(3),
  channel_state          NUMBER(2),
  com_type               NUMBER(1),
  is_white               VARCHAR2(50),
  most_speed             VARCHAR2(50),
  normal_status          VARCHAR2(50),
  warn_status            VARCHAR2(50),
  busy_status            VARCHAR2(50),
  main_channel           VARCHAR2(50),
  ch_signature           VARCHAR2(50),
  en_signature           VARCHAR2(50),
  gateway                VARCHAR2(50),
  lowest_send            VARCHAR2(50),
  link_mode              VARCHAR2(50),
  parameters             VARCHAR2(4000),
  deploy_status          NUMBER(1) default 0,
  user_name              VARCHAR2(200),
  is_received            NUMBER(1) default 1,
  is_sendstatus          NUMBER(1) default 1,
  is_extended            NUMBER(1) default 1,
  is_longsms             NUMBER(1) default 1,
  spnumber_yd_type       VARCHAR2(50),
  spnumber_lt_type       VARCHAR2(50),
  spnumber_dx_type       VARCHAR2(50),
  sp_no_lt_up            VARCHAR2(50),
  sp_no_yd_up            VARCHAR2(50),
  sp_no_yd_dw            VARCHAR2(50),
  sp_no_lt_dw            VARCHAR2(50),
  sms_max_length_en      NUMBER,
  long_sms_per_length_en NUMBER,
  long_sms_max_length_en NUMBER,
  is_complaint           NUMBER(5),
  sms_max_length_ch      NUMBER,
  long_sms_per_length_ch NUMBER,
  long_sms_max_length_ch NUMBER,
  unsubscribe_keyword    VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.CHANNEL_INFO
  is '����ͨ����Ϣ��';
comment on column mc.CHANNEL_INFO.channel_id
  is 'ͨ��ID';
comment on column mc.CHANNEL_INFO.channel_name
  is 'ͨ������';
comment on column mc.CHANNEL_INFO.sp_no_lt
  is '��ͨ�ط���';
comment on column mc.CHANNEL_INFO.sp_no_yd
  is '�ƶ��ط���';
comment on column mc.CHANNEL_INFO.sp_no_dx
  is '�����ط���';
comment on column mc.CHANNEL_INFO.channel_status
  is 'ͨ��״̬,0:��Ч, 1:��Ч';
comment on column mc.CHANNEL_INFO.channel_clz
  is 'ͨ�����õ���Ͳ�����';
comment on column mc.CHANNEL_INFO.channel_remark
  is '��ע';
comment on column mc.CHANNEL_INFO.sort_id
  is 'ͨ������id';
comment on column mc.CHANNEL_INFO.channel_state
  is 'ͨ������״̬';
comment on column mc.CHANNEL_INFO.com_type
  is '֧�ֺŶ�����,1:ֻ�ƶ�, 2:ֻ��ͨ,3:ֻ����,0:ȫ֧��';
comment on column mc.CHANNEL_INFO.is_white
  is '�Ƿ��������� 0-���� ��1������';
comment on column mc.CHANNEL_INFO.most_speed
  is '����ٶ�';
comment on column mc.CHANNEL_INFO.normal_status
  is '����״̬, ��λΪ����';
comment on column mc.CHANNEL_INFO.warn_status
  is '����״̬, ��λΪ����';
comment on column mc.CHANNEL_INFO.busy_status
  is '��æ״̬, ��λΪ����';
comment on column mc.CHANNEL_INFO.main_channel
  is '��ͨ��, 1:��,0:��';
comment on column mc.CHANNEL_INFO.ch_signature
  is '����ǩ��';
comment on column mc.CHANNEL_INFO.en_signature
  is 'Ӣ��ǩ��';
comment on column mc.CHANNEL_INFO.gateway
  is 'ǩ����ʽ, 0����ǩ����1:����ǩ����2:�Զ����ǩ��';
comment on column mc.CHANNEL_INFO.lowest_send
  is '��ͷ�����';
comment on column mc.CHANNEL_INFO.link_mode
  is '�������ͣ�CMPP��SGIP��SMGP...';
comment on column mc.CHANNEL_INFO.parameters
  is '�������ݣ�JSON��ʽ����';
comment on column mc.CHANNEL_INFO.deploy_status
  is '����״̬, 0-δ����,1-�Ѳ���';
comment on column mc.CHANNEL_INFO.user_name
  is '�����û�';
comment on column mc.CHANNEL_INFO.is_received
  is '�Ƿ�֧������,0:��,1:��';
comment on column mc.CHANNEL_INFO.is_sendstatus
  is '�Ƿ�֧��״̬����,0:��,1:��';
comment on column mc.CHANNEL_INFO.is_extended
  is '�Ƿ�֧����չ��,0:��,1:��';
comment on column mc.CHANNEL_INFO.is_longsms
  is '�Ƿ�֧�ֳ�����,0:��,1:��';
comment on column mc.CHANNEL_INFO.spnumber_yd_type
  is '�ƶ��ط�������';
comment on column mc.CHANNEL_INFO.spnumber_lt_type
  is '��ͨ�ط�������';
comment on column mc.CHANNEL_INFO.spnumber_dx_type
  is '�����ط�������';
comment on column mc.CHANNEL_INFO.sms_max_length_en
  is '��ͨ���ŵ���󳤶�,һ�����Ϊ70(Ӣ��)';
comment on column mc.CHANNEL_INFO.long_sms_per_length_en
  is '��������ÿ���ֶ��ŵĳ���,һ��Ϊ67(Ӣ��)';
comment on column mc.CHANNEL_INFO.long_sms_max_length_en
  is '�����ŵ���󳤶�,����250,300(Ӣ��)';
comment on column mc.CHANNEL_INFO.sms_max_length_ch
  is '��ͨ���ŵ���󳤶�,һ�����Ϊ70(����)';
comment on column mc.CHANNEL_INFO.long_sms_per_length_ch
  is '��������ÿ���ֶ��ŵĳ���,һ��Ϊ67(����)';
comment on column mc.CHANNEL_INFO.long_sms_max_length_ch
  is '�����ŵ���󳤶�,����250,300(����)';
comment on column mc.CHANNEL_INFO.unsubscribe_keyword
  is '�˶��ؼ���';
alter table mc.CHANNEL_INFO
  add constraint PK_CHANNEL_INFO primary key (CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_PRICE_POLICY
prompt ===================================
prompt
create table mc.CHANNEL_PRICE_POLICY
(
  policy_id           VARCHAR2(200) not null,
  channel_id          NUMBER(2),
  policy_type         VARCHAR2(30),
  direct_number       VARCHAR2(30),
  direct_price        VARCHAR2(30),
  direct_add_price    VARCHAR2(20),
  indirect_min_number NUMBER(18),
  indirect_max_number VARCHAR2(30),
  indirect_price      VARCHAR2(30)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.CHANNEL_PRICE_POLICY
  is 'ͨ���۸���Ա����ڷ���ͳ��';
comment on column mc.CHANNEL_PRICE_POLICY.policy_id
  is '�۸���Ե�ID';
comment on column mc.CHANNEL_PRICE_POLICY.channel_id
  is 'ͨ�����';
comment on column mc.CHANNEL_PRICE_POLICY.policy_type
  is '�������ͣ�1--��ֱ��ͨ����2--���õ�����ͨ��';
comment on column mc.CHANNEL_PRICE_POLICY.direct_number
  is 'ֱ��ʱ���»�������';
comment on column mc.CHANNEL_PRICE_POLICY.direct_price
  is 'ֱ��ʱ���»��������ļ۸�';
comment on column mc.CHANNEL_PRICE_POLICY.direct_add_price
  is 'ֱ��ʱ����ֵҵ���ÿ���۸�';
comment on column mc.CHANNEL_PRICE_POLICY.indirect_min_number
  is 'ʹ�õ�����ͨ��ʱ����С������';
comment on column mc.CHANNEL_PRICE_POLICY.indirect_max_number
  is 'ʹ�õ�����ͨ��ʱ���������';
comment on column mc.CHANNEL_PRICE_POLICY.indirect_price
  is 'ʹ�õ�����ͨ��ʱ������ÿ���ĵ���';
alter table mc.CHANNEL_PRICE_POLICY
  add constraint PK_CHANNEL_PRICE_POLICY primary key (POLICY_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CHANNEL_SWITCH_CONFIG
prompt ====================================
prompt
create table mc.CHANNEL_SWITCH_CONFIG
(
  pid                VARCHAR2(200) not null,
  channel_id         NUMBER(10) not null,
  ip                 VARCHAR2(200) not null,
  port               NUMBER(10) not null,
  heartbeat_enabled  NUMBER(1) not null,
  dir                VARCHAR2(500),
  heartbeat_interval NUMBER(19)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CHANNEL_SWITCH_CONFIG
  add primary key (PID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_SWITCH_LOG
prompt =================================
prompt
create table mc.CHANNEL_SWITCH_LOG
(
  pid                   VARCHAR2(200) not null,
  rule_id               VARCHAR2(200),
  match_user_id         VARCHAR2(200),
  match_org_id          VARCHAR2(200),
  dest_channel_id       NUMBER(10) not null,
  original_channel_id   NUMBER(10) not null,
  operator_id           VARCHAR2(200),
  match_quantity        NUMBER(19),
  match_mobile          VARCHAR2(100),
  match_batch_id        VARCHAR2(200),
  match_content         VARCHAR2(200),
  match_operator        NUMBER(3) not null,
  direction             NUMBER(3) not null,
  operation_date        DATE not null,
  operation_result      NUMBER(3),
  operation_result_desc VARCHAR2(500)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.CHANNEL_SWITCH_LOG
  add primary key (PID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CHANNEL_SWITCH_RULE
prompt ==================================
prompt
create table mc.CHANNEL_SWITCH_RULE
(
  pid                 VARCHAR2(200) not null,
  original_channel_id NUMBER(10) not null,
  match_org_id        VARCHAR2(200),
  match_user_id       VARCHAR2(200),
  match_quantity      NUMBER(19),
  match_mobile        VARCHAR2(100),
  match_batch_id      VARCHAR2(200),
  match_content       VARCHAR2(200),
  match_operator      NUMBER(3) not null,
  direction           NUMBER(3) not null,
  dest_channel_id     NUMBER(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.CHANNEL_SWITCH_RULE
  add primary key (PID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CHANNEL_TEST
prompt ===========================
prompt
create table mc.CHANNEL_TEST
(
  channel_test_id VARCHAR2(200) not null,
  mobile_to       VARCHAR2(2000) not null,
  send_msg        VARCHAR2(4000),
  send_time       VARCHAR2(30) default sysdate,
  channel_id      NUMBER(4) default 1,
  create_time     DATE default sysdate,
  remark          VARCHAR2(500),
  trigger_name    VARCHAR2(80) not null,
  ext_num         VARCHAR2(80)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.CHANNEL_TEST
  is 'ͨ�����Զ�ʱ�����';
comment on column mc.CHANNEL_TEST.channel_test_id
  is '����';
comment on column mc.CHANNEL_TEST.mobile_to
  is 'Ŀ���ֻ���';
comment on column mc.CHANNEL_TEST.send_msg
  is '��������';
comment on column mc.CHANNEL_TEST.send_time
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column mc.CHANNEL_TEST.channel_id
  is 'ͨ��ID';
comment on column mc.CHANNEL_TEST.create_time
  is '������ʱ����ʱ��';
comment on column mc.CHANNEL_TEST.remark
  is '��ע��Ϣ����Ϊ�ⲿϵͳ��չ�ã�CC����ϵͳ���ֶ���д�����˺�';
comment on column mc.CHANNEL_TEST.trigger_name
  is '��ʱ������';
comment on column mc.CHANNEL_TEST.ext_num
  is '�Զ�����չ��';
alter table mc.CHANNEL_TEST
  add constraint PK_CHANNEL_TEST primary key (CHANNEL_TEST_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USER_INFO
prompt ========================
prompt
create table mc.USER_INFO
(
  user_id              VARCHAR2(200) not null,
  user_name            VARCHAR2(200),
  user_pass            VARCHAR2(200),
  user_stat            NUMBER(1),
  user_mome            VARCHAR2(200),
  user_def_role        VARCHAR2(200),
  user_type            NUMBER(1),
  user_balance         NUMBER(20,3),
  create_time          DATE,
  organization_id      VARCHAR2(200),
  eng_signature        VARCHAR2(20),
  chn_signature        VARCHAR2(40),
  use_user_signature   NUMBER(1),
  extend_number        VARCHAR2(20),
  user_quota           NUMBER(22) default 0,
  pay_type             NUMBER(1),
  pay_mode             NUMBER(1),
  fee_mode             NUMBER(1),
  channel_type         NUMBER(1),
  mobile_type          NUMBER(1),
  email                VARCHAR2(200),
  mobile               VARCHAR2(200),
  sms_alert            NUMBER(1),
  mms_quota            NUMBER(22) default 0,
  recharge_explain     VARCHAR2(200),
  nick_name            VARCHAR2(200),
  user_kind            NUMBER(1),
  is_instead_send      NUMBER(1),
  login_error_num      NUMBER(10),
  last_update_psw_date DATE,
  valid_ip             VARCHAR2(2000),
  valid_mobile         VARCHAR2(200),
  ip_status            NUMBER(1) default 0,
  mobile_status        NUMBER(1) default 0,
  sys_code             VARCHAR2(20),
  sms_type             VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.USER_INFO
  is '�û���';
comment on column mc.USER_INFO.user_id
  is '�û����';
comment on column mc.USER_INFO.user_name
  is '�û�����';
comment on column mc.USER_INFO.user_pass
  is '����';
comment on column mc.USER_INFO.user_stat
  is '״̬, 0:��Ч, 1:��Ч,2:��ɾ��,3:������ ';
comment on column mc.USER_INFO.user_mome
  is '��ע';
comment on column mc.USER_INFO.user_def_role
  is '�û�Ĭ�Ͻ�ɫ';
comment on column mc.USER_INFO.user_type
  is '�û�����, 2:��ͨԱ��, 1:�����Ա';
comment on column mc.USER_INFO.user_balance
  is '�û����÷���';
comment on column mc.USER_INFO.create_time
  is '����ʱ��';
comment on column mc.USER_INFO.organization_id
  is '����ID';
comment on column mc.USER_INFO.eng_signature
  is '�û���Ӣ��ǩ��';
comment on column mc.USER_INFO.chn_signature
  is '�û�������ǩ��';
comment on column mc.USER_INFO.use_user_signature
  is '�Ƿ���Ҫ�û�ǩ��, 0:��Ҫ, 1:����Ҫ';
comment on column mc.USER_INFO.extend_number
  is '�û���չ��';
comment on column mc.USER_INFO.user_quota
  is '�������';
comment on column mc.USER_INFO.pay_type
  is '��ֵ����, 0:Ԥ����, 1:�󸶷�';
comment on column mc.USER_INFO.pay_mode
  is '�Ʒѵ�λ, 0:����, 1:����';
comment on column mc.USER_INFO.fee_mode
  is '�۷ѷ�ʽ, 0:�Ը���, 1:�鸶��';
comment on column mc.USER_INFO.channel_type
  is '�Ƿ�����ͨ��, 0:������, 1:����';
comment on column mc.USER_INFO.mobile_type
  is '�Ƿ����ֺŶ�, 0:������, 1:����';
comment on column mc.USER_INFO.email
  is 'E-mail';
comment on column mc.USER_INFO.mobile
  is '�ֻ�����';
comment on column mc.USER_INFO.sms_alert
  is '������������, 0:��, 1:��';
comment on column mc.USER_INFO.mms_quota
  is '�������';
comment on column mc.USER_INFO.recharge_explain
  is '��ֵ˵��';
comment on column mc.USER_INFO.user_kind
  is '�û����ࣺ1��Webƽ̨�û���2��WebService�ӿ��û���3��CMPP�ӿ��û���4��HTTP�ӿ��û�';
comment on column mc.USER_INFO.is_instead_send
  is '�Ƿ����������Ϣ   0:��  1����';
comment on column mc.USER_INFO.login_error_num
  is '��¼ʧ�ܴ���  �����������3���޸��û�״̬Ϊ��Ч���������ټ�����¼';
comment on column mc.USER_INFO.valid_ip
  is '�û��󶨵�IP��ַ';
comment on column mc.USER_INFO.valid_mobile
  is '�û��󶨵��ֻ�����';
comment on column mc.USER_INFO.ip_status
  is '�û�IP�󶨵�״̬, 0:���� , 1:�� ';
comment on column mc.USER_INFO.mobile_status
  is '�û��ֻ�����󶨵�״̬, 0:���� , 1:�� ';
alter table mc.USER_INFO
  add constraint PK_USER_INFO primary key (USER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_USER
prompt ===========================
prompt
create table mc.CHANNEL_USER
(
  id              VARCHAR2(20) not null,
  user_id         VARCHAR2(200) not null,
  channel_id      NUMBER(4) not null,
  create_user     VARCHAR2(200),
  create_time     DATE,
  com_type        NUMBER(1),
  cascade_id      VARCHAR2(1000),
  defalut_channel NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column mc.CHANNEL_USER.id
  is '����';
comment on column mc.CHANNEL_USER.user_id
  is '�û�id';
comment on column mc.CHANNEL_USER.channel_id
  is 'ͨ��id';
comment on column mc.CHANNEL_USER.create_user
  is '������';
comment on column mc.CHANNEL_USER.create_time
  is '����ʱ��';
comment on column mc.CHANNEL_USER.com_type
  is '1:�ƶ�, 2:��ͨ,3:����,0:ȫ֧��';
comment on column mc.CHANNEL_USER.cascade_id
  is '����id:���ڶԱ���ɾ�������';
alter table mc.CHANNEL_USER
  add constraint PK_ID primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CHANNEL_USER
  add constraint FK_CID foreign key (CHANNEL_ID)
  references mc.CHANNEL_INFO (CHANNEL_ID) on delete cascade;
alter table mc.CHANNEL_USER
  add constraint FK_UID foreign key (USER_ID)
  references mc.USER_INFO (USER_ID) on delete cascade;

prompt
prompt Creating table COMMON_MODULE_INFO
prompt =================================
prompt
create table mc.COMMON_MODULE_INFO
(
  module_id     NUMBER(18) not null,
  p_module_id   NUMBER(18),
  module_name   VARCHAR2(50),
  module_url    VARCHAR2(200),
  module_remark VARCHAR2(500),
  module_sort   NUMBER(4),
  module_level  NUMBER(2),
  module_status CHAR(1) default '1'
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.COMMON_MODULE_INFO
  is '��������ƽ̨ģ���';
comment on column mc.COMMON_MODULE_INFO.module_id
  is 'ģ��ID';
comment on column mc.COMMON_MODULE_INFO.p_module_id
  is '��ģ��ID';
comment on column mc.COMMON_MODULE_INFO.module_name
  is 'ģ������';
comment on column mc.COMMON_MODULE_INFO.module_url
  is 'ģ��URL';
comment on column mc.COMMON_MODULE_INFO.module_remark
  is 'ģ�鱸ע';
comment on column mc.COMMON_MODULE_INFO.module_sort
  is '��ʾ˳��';
comment on column mc.COMMON_MODULE_INFO.module_level
  is 'ģ�鼶��';
comment on column mc.COMMON_MODULE_INFO.module_status
  is 'ģ��״̬ 0:ͣ��, 1:����';
alter table mc.COMMON_MODULE_INFO
  add constraint PK_COMMON_MODULE_INFO primary key (MODULE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONSUME_RECORD_INFO
prompt ==================================
prompt
create table mc.CONSUME_RECORD_INFO
(
  record_id       VARCHAR2(200) not null,
  consumer_id     VARCHAR2(200),
  consumer_name   VARCHAR2(200),
  send_time       DATE default sysdate,
  send_quantity   NUMBER(10),
  send_type       NUMBER(10) default 0,
  remain_quota    NUMBER(10),
  unit_price      NUMBER(10,3),
  cost_fee        NUMBER(10,3),
  remark          VARCHAR2(200),
  send_msg        VARCHAR2(2000),
  gw_type         NUMBER(10) default 0,
  biz_type        NUMBER(3) default 0,
  channel_id      NUMBER(10) default 0,
  user_mome       VARCHAR2(200),
  batch_id        VARCHAR2(200),
  remain_balance  NUMBER(10,3) default 0.00,
  organization_id VARCHAR2(200),
  fee_mode        NUMBER(1),
  pay_type        NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.CONSUME_RECORD_INFO
  is '������ˮ��¼';
comment on column mc.CONSUME_RECORD_INFO.record_id
  is 'id';
comment on column mc.CONSUME_RECORD_INFO.consumer_id
  is '�û�id';
comment on column mc.CONSUME_RECORD_INFO.consumer_name
  is '�û���¼��';
comment on column mc.CONSUME_RECORD_INFO.send_time
  is '����ʱ��';
comment on column mc.CONSUME_RECORD_INFO.send_quantity
  is '������';
comment on column mc.CONSUME_RECORD_INFO.send_type
  is '�������͡�0��ͨ����,1��������,2�ظ�����,3Ⱥ�鷢��,4socket����,5webservice����,6�ֹ�����,7Ԥ������,8�����ʾ�,9����ף��,10��ͨ����,11�˵�����,20��ͨemail';
comment on column mc.CONSUME_RECORD_INFO.remain_quota
  is 'ʣ�����';
comment on column mc.CONSUME_RECORD_INFO.unit_price
  is '����';
comment on column mc.CONSUME_RECORD_INFO.cost_fee
  is '���ζ��ŷ���';
comment on column mc.CONSUME_RECORD_INFO.remark
  is '��ע';
comment on column mc.CONSUME_RECORD_INFO.send_msg
  is '�����ζ��ŵ�����(�������ͷ�ʽֻ��¼��һ�����ŵ�����)';
comment on column mc.CONSUME_RECORD_INFO.gw_type
  is '�Ŷ����͡�0-ȫ��·��1-�ƶ��ŶΣ�2-��ͨ�ŶΣ�3-С��ͨ�Ŷ�';
comment on column mc.CONSUME_RECORD_INFO.biz_type
  is 'ҵ�����͡�0-��ͨ����ҵ��1-����ҵ��2-emailҵ��';
comment on column mc.CONSUME_RECORD_INFO.channel_id
  is '����ͨ����0-����ͨ��';
comment on column mc.CONSUME_RECORD_INFO.user_mome
  is '�û����';
comment on column mc.CONSUME_RECORD_INFO.batch_id
  is '���κ�';
comment on column mc.CONSUME_RECORD_INFO.remain_balance
  is 'ʣ����';
comment on column mc.CONSUME_RECORD_INFO.organization_id
  is '����id ';
comment on column mc.CONSUME_RECORD_INFO.fee_mode
  is '�����ĸ������� 0:�Ը���, 1:�鸶��';
comment on column mc.CONSUME_RECORD_INFO.pay_type
  is '��ֵ����, 0:Ԥ����, 1:�󸶷�';
alter table mc.CONSUME_RECORD_INFO
  add primary key (RECORD_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table COUNT_SEND_STATUS
prompt ================================
prompt
create table mc.COUNT_SEND_STATUS
(
  id            VARCHAR2(200) not null,
  all_count     VARCHAR2(50),
  sending_count VARCHAR2(50),
  create_time   DATE,
  sent_count    VARCHAR2(50),
  receive_count VARCHAR2(50),
  suc_count     VARCHAR2(50),
  channel_id    VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.COUNT_SEND_STATUS
  is '��״̬��������';
comment on column mc.COUNT_SEND_STATUS.id
  is '����';
comment on column mc.COUNT_SEND_STATUS.all_count
  is '����';
comment on column mc.COUNT_SEND_STATUS.sending_count
  is '����������';
comment on column mc.COUNT_SEND_STATUS.create_time
  is '������ʱ��';
comment on column mc.COUNT_SEND_STATUS.sent_count
  is '���ύ����';
comment on column mc.COUNT_SEND_STATUS.receive_count
  is '��������';
comment on column mc.COUNT_SEND_STATUS.suc_count
  is '�ɹ�����';
comment on column mc.COUNT_SEND_STATUS.channel_id
  is '0Ϊ����ͨ��';
alter table mc.COUNT_SEND_STATUS
  add constraint PK_COUNT_SEND_STATUS primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CUSTOMER
prompt =======================
prompt
create table mc.CUSTOMER
(
  customer_id        VARCHAR2(50) not null,
  mobile             VARCHAR2(50),
  mobile_user_name   VARCHAR2(200),
  birthday           DATE,
  email              VARCHAR2(200),
  mobile_remark      VARCHAR2(200),
  create_user_id     VARCHAR2(50),
  organization_id    VARCHAR2(200),
  create_time        DATE,
  modify_time        DATE,
  customer_type_id   VARCHAR2(100),
  define_column_1    VARCHAR2(100),
  define_column_2    VARCHAR2(100),
  define_column_3    VARCHAR2(100),
  define_column_4    VARCHAR2(100),
  define_column_5    VARCHAR2(100),
  define_column_6    VARCHAR2(100),
  define_column_7    VARCHAR2(100),
  define_column_8    VARCHAR2(100),
  define_column_9    VARCHAR2(100),
  define_column_10   VARCHAR2(100),
  define_column_11   VARCHAR2(100),
  define_column_12   VARCHAR2(100),
  define_column_13   VARCHAR2(100),
  define_column_14   VARCHAR2(100),
  define_column_15   VARCHAR2(100),
  group_id           VARCHAR2(4000),
  mobile_type        VARCHAR2(50),
  mobile_user_fundid VARCHAR2(50),
  secucode           VARCHAR2(200),
  order_start_date   DATE,
  order_du_date      DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CUSTOMER
  add primary key (CUSTOMER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GROUP_INFO
prompt =========================
prompt
create table mc.GROUP_INFO
(
  group_id          VARCHAR2(50) not null,
  user_id           VARCHAR2(200) not null,
  group_name        VARCHAR2(30),
  group_remark      VARCHAR2(100),
  create_time       DATE,
  modify_time       DATE,
  organization_id   VARCHAR2(200),
  create_user_id    VARCHAR2(200),
  is_share          NUMBER(1) default 0,
  parent_group_id   VARCHAR2(50),
  parent_group_type VARCHAR2(20),
  is_public         VARCHAR2(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table mc.GROUP_INFO
  add primary key (GROUP_ID, USER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CUSTOMER_GROUP
prompt =============================
prompt
create table mc.CUSTOMER_GROUP
(
  group_id    VARCHAR2(50) not null,
  user_id     VARCHAR2(200) not null,
  customer_id VARCHAR2(50) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CUSTOMER_GROUP
  add primary key (CUSTOMER_ID, GROUP_ID, USER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CUSTOMER_GROUP
  add constraint FK3B0AF2BE327A2DB0 foreign key (GROUP_ID, USER_ID)
  references mc.GROUP_INFO (GROUP_ID, USER_ID);
alter table mc.CUSTOMER_GROUP
  add constraint FK3B0AF2BED11A972F foreign key (CUSTOMER_ID)
  references mc.CUSTOMER (CUSTOMER_ID);

prompt
prompt Creating table CUSTOMER_INFO
prompt ============================
prompt
create table mc.CUSTOMER_INFO
(
  customer_id      VARCHAR2(50) not null,
  mobile_user_name VARCHAR2(50),
  mobile           VARCHAR2(50),
  group_id         VARCHAR2(50),
  create_time      DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.CUSTOMER_INFO
  is '�ͻ���';
comment on column mc.CUSTOMER_INFO.customer_id
  is '�ͻ��������';
comment on column mc.CUSTOMER_INFO.mobile_user_name
  is '�ͻ�������';
comment on column mc.CUSTOMER_INFO.mobile
  is '�ͻ��ֻ���';
comment on column mc.CUSTOMER_INFO.group_id
  is '�ͻ���������';
comment on column mc.CUSTOMER_INFO.create_time
  is '��ӿͻ�ʱ��ʱ��';
alter table mc.CUSTOMER_INFO
  add constraint PK_CUSTOMER_INFO primary key (CUSTOMER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index mc.IDX_CU_MOBILE on mc.CUSTOMER_INFO (MOBILE, MOBILE_USER_NAME, GROUP_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CUSTOMER_LOG
prompt ===========================
prompt
create table mc.CUSTOMER_LOG
(
  log_id           VARCHAR2(50) not null,
  mobile           VARCHAR2(200),
  oper_user        VARCHAR2(50),
  oper_group       VARCHAR2(50),
  type             NUMBER(1),
  createtime       DATE,
  modifytime       VARCHAR2(200),
  reservedint      NUMBER(1),
  reservedchar     VARCHAR2(200),
  productid        VARCHAR2(200),
  organizationid   VARCHAR2(200),
  message          VARCHAR2(2000),
  order_start_date DATE,
  order_du_date    DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.CUSTOMER_LOG
  is '�ͻ���Ϣ��';
alter table mc.CUSTOMER_LOG
  add constraint PK_CUSTOMER_LOG primary key (LOG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CUSTOMER_TYPE
prompt ============================
prompt
create table mc.CUSTOMER_TYPE
(
  customer_type_id   VARCHAR2(100) not null,
  customer_type_name VARCHAR2(100),
  create_user        VARCHAR2(50),
  create_time        DATE,
  modify_time        DATE,
  description        VARCHAR2(200),
  organization_id    VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CUSTOMER_TYPE
  add primary key (CUSTOMER_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CUSTOMER_TYPE_ATTR
prompt =================================
prompt
create table mc.CUSTOMER_TYPE_ATTR
(
  customer_type_id VARCHAR2(100) not null,
  attr_name        VARCHAR2(100) not null,
  define_column    NUMBER(10),
  description      VARCHAR2(200),
  js_validate      VARCHAR2(500),
  attr_type        NUMBER(10),
  id               VARCHAR2(100),
  create_time      DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CUSTOMER_TYPE_ATTR
  add primary key (CUSTOMER_TYPE_ID, ATTR_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DAILY_RECKONING_INFO
prompt ===================================
prompt
create table mc.DAILY_RECKONING_INFO
(
  daily_reckoning_id   VARCHAR2(200) not null,
  user_id              VARCHAR2(200) not null,
  user_name            VARCHAR2(200),
  send_status          VARCHAR2(200),
  send_quantity        INTEGER,
  sub_total_fee        NUMBER(13,3),
  remain_message_quota NUMBER(10),
  remain_mms_quota     NUMBER(10),
  reckoning_date       DATE,
  record_date          DATE default sysdate,
  pay_mode             NUMBER(1) default 0,
  remain_balance       NUMBER(10,3) default 0.000,
  user_mome            VARCHAR2(200),
  mobile_com           NUMBER(2),
  channel_id           NUMBER(4),
  unit_price           NUMBER(10,3)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.DAILY_RECKONING_INFO
  is '�սᵥ��';
comment on column mc.DAILY_RECKONING_INFO.daily_reckoning_id
  is 'id';
comment on column mc.DAILY_RECKONING_INFO.user_id
  is '�˻�id';
comment on column mc.DAILY_RECKONING_INFO.user_name
  is '�˻���';
comment on column mc.DAILY_RECKONING_INFO.send_status
  is '����״̬(��ֻ���ύ�ͷ��ͳɹ���)';
comment on column mc.DAILY_RECKONING_INFO.send_quantity
  is '�ƷѶ��ŵ�����';
comment on column mc.DAILY_RECKONING_INFO.sub_total_fee
  is '���ŷ���';
comment on column mc.DAILY_RECKONING_INFO.remain_message_quota
  is 'ʣ��������';
comment on column mc.DAILY_RECKONING_INFO.remain_mms_quota
  is 'ʣ��������';
comment on column mc.DAILY_RECKONING_INFO.reckoning_date
  is '���ŷ��͵�����';
comment on column mc.DAILY_RECKONING_INFO.record_date
  is '��¼����';
comment on column mc.DAILY_RECKONING_INFO.pay_mode
  is '�Ʒ�ģʽ';
comment on column mc.DAILY_RECKONING_INFO.remain_balance
  is 'ʣ����';
comment on column mc.DAILY_RECKONING_INFO.user_mome
  is '�˻�����';
comment on column mc.DAILY_RECKONING_INFO.mobile_com
  is '��Ӫ��ID��1Ϊ�ƶ���2Ϊ��ͨ,3Ϊ����,0Ϊȫ�� ';
comment on column mc.DAILY_RECKONING_INFO.channel_id
  is 'ͨ��ID';
alter table mc.DAILY_RECKONING_INFO
  add constraint PK_DAILY_RECKONING_INFO primary key (DAILY_RECKONING_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DATA_SOURCE_TYPE
prompt ===============================
prompt
create table mc.DATA_SOURCE_TYPE
(
  data_source_type_id   VARCHAR2(20) not null,
  description           VARCHAR2(255),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.DATA_SOURCE_TYPE
  add constraint PK_DATA_SOURCE_TYPE primary key (DATA_SOURCE_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.DT_SRC_TP_TXCRTS on mc.DATA_SOURCE_TYPE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.DT_SRC_TP_TXSTMP on mc.DATA_SOURCE_TYPE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table DATA_SOURCE
prompt ==========================
prompt
create table mc.DATA_SOURCE
(
  data_source_id        VARCHAR2(20) not null,
  data_source_type_id   VARCHAR2(20),
  description           VARCHAR2(255),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.DATA_SOURCE
  add constraint PK_DATA_SOURCE primary key (DATA_SOURCE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.DATA_SOURCE
  add constraint DATA_SRC_TYP foreign key (DATA_SOURCE_TYPE_ID)
  references mc.DATA_SOURCE_TYPE (DATA_SOURCE_TYPE_ID);
create index mc.DATA_SOURCE_TXCRTS on mc.DATA_SOURCE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.DATA_SOURCE_TXSTMP on mc.DATA_SOURCE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.DATA_SRC_TYP on mc.DATA_SOURCE (DATA_SOURCE_TYPE_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table DB_INTERFACE_INFO
prompt ================================
prompt
create table mc.DB_INTERFACE_INFO
(
  db_interface_id   VARCHAR2(200) not null,
  zhang_hao         VARCHAR2(200),
  pass_word         VARCHAR2(200),
  send_select_limit VARCHAR2(30),
  send_insert_limit VARCHAR2(30),
  receive_limit     VARCHAR2(30),
  pro_class_limit   VARCHAR2(30),
  pro_limit         VARCHAR2(30)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.DB_INTERFACE_INFO
  is '���ݿ�ӿ�';
comment on column mc.DB_INTERFACE_INFO.db_interface_id
  is '���ݿ�ӿڵ�ID';
comment on column mc.DB_INTERFACE_INFO.zhang_hao
  is '�˺�';
comment on column mc.DB_INTERFACE_INFO.pass_word
  is '����';
comment on column mc.DB_INTERFACE_INFO.send_select_limit
  is 'sms_send���Ȩ��:select--��ѯȨ��';
comment on column mc.DB_INTERFACE_INFO.send_insert_limit
  is 'sms_send���Ȩ��:insert--����Ȩ��';
comment on column mc.DB_INTERFACE_INFO.receive_limit
  is 'sms_receive���Ȩ�ޣ�select--��ѯȨ��';
comment on column mc.DB_INTERFACE_INFO.pro_class_limit
  is '����Υ���ʷ����Ȩ�ޣ�select--��ѯȨ��';
comment on column mc.DB_INTERFACE_INFO.pro_limit
  is '����Υ���ʵ�Ȩ�ޣ�select--��ѯȨ��';
alter table mc.DB_INTERFACE_INFO
  add constraint PK_DB_INTERFACE_INFO primary key (DB_INTERFACE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table DEMO
prompt ===================
prompt
create table mc.DEMO
(
  channelid VARCHAR2(200),
  status    VARCHAR2(200),
  devile    VARCHAR2(200),
  errmsg    VARCHAR2(200),
  mobile_to VARCHAR2(200),
  sequence  VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DIC_ALL_KIND
prompt ===========================
prompt
create table mc.DIC_ALL_KIND
(
  kind_code      VARCHAR2(128) not null,
  kind_name      VARCHAR2(128) not null,
  memo           VARCHAR2(128),
  operation_kind VARCHAR2(32) not null,
  operation_name VARCHAR2(128) not null,
  user_id        VARCHAR2(128)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.DIC_ALL_KIND
  is 'ϵͳ�ֵ��';
comment on column mc.DIC_ALL_KIND.kind_code
  is '�ֵ����';
comment on column mc.DIC_ALL_KIND.kind_name
  is '�ֵ�����';
comment on column mc.DIC_ALL_KIND.memo
  is '��ע';
comment on column mc.DIC_ALL_KIND.operation_kind
  is '��������';
comment on column mc.DIC_ALL_KIND.operation_name
  is '������������';
comment on column mc.DIC_ALL_KIND.user_id
  is '�û�id';

prompt
prompt Creating table DRAFT_INFO
prompt =========================
prompt
create table mc.DRAFT_INFO
(
  draft_id    VARCHAR2(200) not null,
  context     VARCHAR2(4000),
  mobile_to   VARCHAR2(4000),
  user_id     VARCHAR2(200),
  create_date DATE,
  content     VARCHAR2(2000),
  group_ids   CLOB,
  group_names CLOB,
  mobile      CLOB,
  create_time TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.DRAFT_INFO
  is '���Ųݸ�';
comment on column mc.DRAFT_INFO.draft_id
  is '�ݸ���';
comment on column mc.DRAFT_INFO.context
  is '��������';
comment on column mc.DRAFT_INFO.mobile_to
  is '�ֻ���';
comment on column mc.DRAFT_INFO.user_id
  is '�û����';
comment on column mc.DRAFT_INFO.create_date
  is '��������';
alter table mc.DRAFT_INFO
  add constraint PK_DRAFT_INFO primary key (DRAFT_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table D_ORG_INFO
prompt =========================
prompt
create table mc.D_ORG_INFO
(
  org_id        VARCHAR2(200) not null,
  org_name      VARCHAR2(200),
  org_full_name VARCHAR2(200),
  org_sts       VARCHAR2(200),
  org_type_code VARCHAR2(200),
  super_org_no  VARCHAR2(200),
  is_frz        VARCHAR2(200),
  extend_str    VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.D_ORG_INFO
  is '��ʱ������Ϣ��';
comment on column mc.D_ORG_INFO.org_id
  is '�������';
comment on column mc.D_ORG_INFO.org_name
  is '��������';
comment on column mc.D_ORG_INFO.org_full_name
  is '����ȫ��';
comment on column mc.D_ORG_INFO.org_sts
  is '����״̬0 ����,9 ע��';
comment on column mc.D_ORG_INFO.org_type_code
  is '�������ʹ��룬01:������02��Ӫҵ��';
comment on column mc.D_ORG_INFO.super_org_no
  is '�ϼ��������';
comment on column mc.D_ORG_INFO.is_frz
  is '�Ƿ񶳽� 0 δ����,1 ����';
comment on column mc.D_ORG_INFO.extend_str
  is 'Ԥ��';
alter table mc.D_ORG_INFO
  add constraint PK_D_ORG_INFO primary key (ORG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table D_SYS_CODE
prompt =========================
prompt
create table mc.D_SYS_CODE
(
  subsys_code_id   VARCHAR2(20) not null,
  subsys_code_name VARCHAR2(200),
  description      VARCHAR2(200),
  sys_id           NUMBER(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.D_SYS_CODE
  is '��ʱ��Ϣ��Դ�����ֵ�';
comment on column mc.D_SYS_CODE.subsys_code_id
  is '��Ϣ��Դ���';
comment on column mc.D_SYS_CODE.subsys_code_name
  is '��Ϣ��Դ����';
comment on column mc.D_SYS_CODE.description
  is '��ע';
comment on column mc.D_SYS_CODE.sys_id
  is '��Ϣ��Դ��չ��';
alter table mc.D_SYS_CODE
  add constraint PK_D_SYS_CODE primary key (SUBSYS_CODE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_GROUP
prompt ===========================
prompt
create table mc.ENTITY_GROUP
(
  entity_group_id       VARCHAR2(20) not null,
  entity_group_name     VARCHAR2(100),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_GROUP
  add constraint PK_ENTITY_GROUP primary key (ENTITY_GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENTT_GRP_TXCRTS on mc.ENTITY_GROUP (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENTT_GRP_TXSTMP on mc.ENTITY_GROUP (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_GROUP_ENTRY
prompt =================================
prompt
create table mc.ENTITY_GROUP_ENTRY
(
  entity_group_id       VARCHAR2(20) not null,
  entity_or_package     VARCHAR2(255) not null,
  appl_enum_id          VARCHAR2(20),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_GROUP_ENTRY
  add constraint PK_ENTITY_GROUP_ENTRY primary key (ENTITY_GROUP_ID, ENTITY_OR_PACKAGE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.ENTITY_GROUP_ENTRY
  add constraint ENTGRP_GRP foreign key (ENTITY_GROUP_ID)
  references mc.ENTITY_GROUP (ENTITY_GROUP_ID);
create index mc.ENTGRP_GRP on mc.ENTITY_GROUP_ENTRY (ENTITY_GROUP_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_GRP_ENR_TXCRTS on mc.ENTITY_GROUP_ENTRY (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_GRP_ENR_TXSTMP on mc.ENTITY_GROUP_ENTRY (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_KEY_STORE
prompt ===============================
prompt
create table mc.ENTITY_KEY_STORE
(
  key_name              VARCHAR2(255) not null,
  key_text              VARCHAR2(255),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ENTITY_KEY_STORE
  add constraint PK_ENTITY_KEY_STORE primary key (KEY_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENTT_K_STR_TXCRTS on mc.ENTITY_KEY_STORE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENTT_K_STR_TXSTMP on mc.ENTITY_KEY_STORE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ENTITY_SYNC
prompt ==========================
prompt
create table mc.ENTITY_SYNC
(
  entity_sync_id               VARCHAR2(20) not null,
  run_status_id                VARCHAR2(20),
  last_successful_synch_time   TIMESTAMP(6),
  last_history_start_date      TIMESTAMP(6),
  pre_offline_synch_time       TIMESTAMP(6),
  offline_sync_split_millis    NUMBER(18),
  sync_split_millis            NUMBER(18),
  sync_end_buffer_millis       NUMBER(18),
  max_running_no_update_millis NUMBER(18),
  target_service_name          VARCHAR2(255),
  target_delegator_name        VARCHAR2(255),
  keep_remove_info_hours       NUMBER(18,6),
  for_pull_only                CHAR(1),
  for_push_only                CHAR(1),
  last_updated_stamp           TIMESTAMP(6),
  last_updated_tx_stamp        TIMESTAMP(6),
  created_stamp                TIMESTAMP(6),
  created_tx_stamp             TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_SYNC
  add constraint PK_ENTITY_SYNC primary key (ENTITY_SYNC_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENTITY_SYNC_TXCRTS on mc.ENTITY_SYNC (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENTITY_SYNC_TXSTMP on mc.ENTITY_SYNC (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_SYNC_HISTORY
prompt ==================================
prompt
create table mc.ENTITY_SYNC_HISTORY
(
  entity_sync_id             VARCHAR2(20) not null,
  start_date                 TIMESTAMP(6) not null,
  run_status_id              VARCHAR2(20),
  beginning_synch_time       TIMESTAMP(6),
  last_successful_synch_time TIMESTAMP(6),
  last_candidate_end_time    TIMESTAMP(6),
  last_split_start_time      NUMBER(18),
  to_create_inserted         NUMBER(18),
  to_create_updated          NUMBER(18),
  to_create_not_updated      NUMBER(18),
  to_store_inserted          NUMBER(18),
  to_store_updated           NUMBER(18),
  to_store_not_updated       NUMBER(18),
  to_remove_deleted          NUMBER(18),
  to_remove_already_deleted  NUMBER(18),
  total_rows_exported        NUMBER(18),
  total_rows_to_create       NUMBER(18),
  total_rows_to_store        NUMBER(18),
  total_rows_to_remove       NUMBER(18),
  total_splits               NUMBER(18),
  total_store_calls          NUMBER(18),
  running_time_millis        NUMBER(18),
  per_split_min_millis       NUMBER(18),
  per_split_max_millis       NUMBER(18),
  per_split_min_items        NUMBER(18),
  per_split_max_items        NUMBER(18),
  last_updated_stamp         TIMESTAMP(6),
  last_updated_tx_stamp      TIMESTAMP(6),
  created_stamp              TIMESTAMP(6),
  created_tx_stamp           TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_SYNC_HISTORY
  add constraint PK_ENTITY_SYNC_HISTORY primary key (ENTITY_SYNC_ID, START_DATE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.ENTITY_SYNC_HISTORY
  add constraint ENTSYNC_HSTSNC foreign key (ENTITY_SYNC_ID)
  references mc.ENTITY_SYNC (ENTITY_SYNC_ID);
create index mc.ENTSYNC_HSTSNC on mc.ENTITY_SYNC_HISTORY (ENTITY_SYNC_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_HSR_TXCRTS on mc.ENTITY_SYNC_HISTORY (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_HSR_TXSTMP on mc.ENTITY_SYNC_HISTORY (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_SYNC_INCLUDE
prompt ==================================
prompt
create table mc.ENTITY_SYNC_INCLUDE
(
  entity_sync_id        VARCHAR2(20) not null,
  entity_or_package     VARCHAR2(255) not null,
  appl_enum_id          VARCHAR2(20),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_SYNC_INCLUDE
  add constraint PK_ENTITY_SYNC_INCLUDE primary key (ENTITY_SYNC_ID, ENTITY_OR_PACKAGE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.ENTITY_SYNC_INCLUDE
  add constraint ENTSYNC_INCSNC foreign key (ENTITY_SYNC_ID)
  references mc.ENTITY_SYNC (ENTITY_SYNC_ID);
create index mc.ENTSYNC_INCSNC on mc.ENTITY_SYNC_INCLUDE (ENTITY_SYNC_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_INCD_TXCRS on mc.ENTITY_SYNC_INCLUDE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_INCD_TXSTP on mc.ENTITY_SYNC_INCLUDE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_SYNC_INCLUDE_GROUP
prompt ========================================
prompt
create table mc.ENTITY_SYNC_INCLUDE_GROUP
(
  entity_sync_id        VARCHAR2(20) not null,
  entity_group_id       VARCHAR2(20) not null,
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_SYNC_INCLUDE_GROUP
  add constraint PK_ENTITY_SYNC_INCLUDE_GROUP primary key (ENTITY_SYNC_ID, ENTITY_GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.ENTITY_SYNC_INCLUDE_GROUP
  add constraint ENTSNCGU_GRP foreign key (ENTITY_GROUP_ID)
  references mc.ENTITY_GROUP (ENTITY_GROUP_ID);
alter table mc.ENTITY_SYNC_INCLUDE_GROUP
  add constraint ENTSNCGU_SNC foreign key (ENTITY_SYNC_ID)
  references mc.ENTITY_SYNC (ENTITY_SYNC_ID);
create index mc.ENTSNCGU_GRP on mc.ENTITY_SYNC_INCLUDE_GROUP (ENTITY_GROUP_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENTSNCGU_SNC on mc.ENTITY_SYNC_INCLUDE_GROUP (ENTITY_SYNC_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_IND_GRP_TP on mc.ENTITY_SYNC_INCLUDE_GROUP (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_IND_GRP_TS on mc.ENTITY_SYNC_INCLUDE_GROUP (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_SYNC_REMOVE
prompt =================================
prompt
create table mc.ENTITY_SYNC_REMOVE
(
  entity_sync_remove_id VARCHAR2(20) not null,
  primary_key_removed   CLOB,
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_SYNC_REMOVE
  add constraint PK_ENTITY_SYNC_REMOVE primary key (ENTITY_SYNC_REMOVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_RMV_TXCRTS on mc.ENTITY_SYNC_REMOVE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_RMV_TXSTMP on mc.ENTITY_SYNC_REMOVE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENUMERATION_TYPE
prompt ===============================
prompt
create table mc.ENUMERATION_TYPE
(
  enum_type_id          VARCHAR2(60) not null,
  parent_type_id        VARCHAR2(20),
  has_table             CHAR(1),
  description           VARCHAR2(255),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ENUMERATION_TYPE
  add constraint PK_ENUMERATION_TYPE primary key (ENUM_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ENUMERATION_TYPE
  add constraint ENUM_TYPE_PARENT foreign key (PARENT_TYPE_ID)
  references mc.ENUMERATION_TYPE (ENUM_TYPE_ID);
create index mc.ENMRTN_TP_TXCRTS on mc.ENUMERATION_TYPE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENMRTN_TP_TXSTMP on mc.ENUMERATION_TYPE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENUM_TYPE_PARENT on mc.ENUMERATION_TYPE (PARENT_TYPE_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ENUMERATION
prompt ==========================
prompt
create table mc.ENUMERATION
(
  enum_id               VARCHAR2(60) not null,
  enum_type_id          VARCHAR2(60),
  enum_code             VARCHAR2(60),
  sequence_id           VARCHAR2(20),
  description           VARCHAR2(255),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ENUMERATION
  add constraint PK_ENUMERATION primary key (ENUM_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ENUMERATION
  add constraint ENUM_TO_TYPE foreign key (ENUM_TYPE_ID)
  references mc.ENUMERATION_TYPE (ENUM_TYPE_ID);
create index mc.ENUMERATION_TXCRTS on mc.ENUMERATION (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENUMERATION_TXSTMP on mc.ENUMERATION (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENUM_TO_TYPE on mc.ENUMERATION (ENUM_TYPE_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EXCEL
prompt ====================
prompt
create table mc.EXCEL
(
  excel_id      VARCHAR2(50) not null,
  excel_name    VARCHAR2(50),
  mobile_to     VARCHAR2(2000),
  send_msg      VARCHAR2(600),
  prior_id      VARCHAR2(10),
  pre_send_time VARCHAR2(50),
  remark        VARCHAR2(500),
  channel_id    VARCHAR2(10),
  user_id       VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.EXCEL
  add constraint PK_EXCEL primary key (EXCEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table GROUPINFO
prompt ========================
prompt
create table mc.GROUPINFO
(
  group_id        VARCHAR2(50) not null,
  group_name      VARCHAR2(30),
  status          NUMBER(1),
  group_type      NUMBER(1),
  is_public       VARCHAR2(10),
  create_time     DATE,
  modify_time     DATE,
  user_id         VARCHAR2(200),
  organization_id VARCHAR2(200),
  parent_id       VARCHAR2(50),
  group_remark    VARCHAR2(50),
  sort            NUMBER(1),
  reservedint     NUMBER(1),
  reservedchar    VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.GROUPINFO
  is '�ͻ�����ģ������Ϣ��';
alter table mc.GROUPINFO
  add constraint PK_GROUPINFO primary key (GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table GROUP_EXCEL_INFO
prompt ===============================
prompt
create table mc.GROUP_EXCEL_INFO
(
  excel_id         VARCHAR2(200) not null,
  excel_name       VARCHAR2(200),
  mobile           VARCHAR2(24),
  mobile_user_name VARCHAR2(50),
  group_id         VARCHAR2(200),
  mobile_remark    VARCHAR2(200),
  birthday         DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.GROUP_EXCEL_INFO
  is 'Ⱥ��EXCEL�����ֻ�����';
comment on column mc.GROUP_EXCEL_INFO.excel_id
  is '���';
comment on column mc.GROUP_EXCEL_INFO.excel_name
  is 'Excel����';
comment on column mc.GROUP_EXCEL_INFO.mobile
  is '�ֻ���';
comment on column mc.GROUP_EXCEL_INFO.mobile_user_name
  is '�û���';
comment on column mc.GROUP_EXCEL_INFO.group_id
  is '��������';
comment on column mc.GROUP_EXCEL_INFO.mobile_remark
  is '��ע';
comment on column mc.GROUP_EXCEL_INFO.birthday
  is '����';
alter table mc.GROUP_EXCEL_INFO
  add constraint PK_GROUP_EXCEL_INFO primary key (EXCEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table GROUP_ORDER_INFO
prompt ===============================
prompt
create table mc.GROUP_ORDER_INFO
(
  order_id              VARCHAR2(200) not null,
  product_id            VARCHAR2(200),
  organization_id       VARCHAR2(200),
  order_type            NUMBER(1) default 0,
  order_address         VARCHAR2(200),
  group_id              VARCHAR2(200),
  order_params          VARCHAR2(200),
  begin_time            DATE default sysdate,
  end_time              DATE default sysdate,
  order_status          NUMBER(1) default 0,
  order_time            DATE default sysdate,
  order_deprecated_flag VARCHAR2(200),
  product_name          VARCHAR2(200),
  customer_id           VARCHAR2(200),
  notify_status         NUMBER(1) default 0,
  user_name             VARCHAR2(200),
  prority               NUMBER(1) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.GROUP_ORDER_INFO
  is '�ͻ��鶩�Ĳ�Ʒ��ģ��';
comment on column mc.GROUP_ORDER_INFO.order_id
  is '�������';
comment on column mc.GROUP_ORDER_INFO.product_id
  is '��Ʒ���';
comment on column mc.GROUP_ORDER_INFO.organization_id
  is '�������';
comment on column mc.GROUP_ORDER_INFO.order_type
  is '���Ʒ�ʽ��0�����š�1������';
comment on column mc.GROUP_ORDER_INFO.order_address
  is '���Ƶĵ�ַ:	�ֻ��Ż�email';
comment on column mc.GROUP_ORDER_INFO.group_id
  is '��������';
comment on column mc.GROUP_ORDER_INFO.order_params
  is '���Ʋ���:��Ʊ���룬�ɶ�ֻ';
comment on column mc.GROUP_ORDER_INFO.begin_time
  is '���ƿ�ʼʱ��';
comment on column mc.GROUP_ORDER_INFO.end_time
  is '���ƽ���ʱ��';
comment on column mc.GROUP_ORDER_INFO.order_status
  is '������Ч״̬��0��������1��δ��ʼ��2���ڡ�3�����ϡ�4����ͣ��5���˶�';
comment on column mc.GROUP_ORDER_INFO.order_time
  is '��������';
comment on column mc.GROUP_ORDER_INFO.order_deprecated_flag
  is '���ڡ�ɾ����ǡ���������״̬�¸�ֵΪ�ա��������ϡ����ڡ���ͣ��δ��ʼ״̬ʱ���������һ����ǣ������������������Ƶ�ַ����(��Ҫ�������ݿ�����)';
comment on column mc.GROUP_ORDER_INFO.product_name
  is '�����Ʒ����';
comment on column mc.GROUP_ORDER_INFO.customer_id
  is '�ͻ���š��ɿͻ�����ά��';
comment on column mc.GROUP_ORDER_INFO.notify_status
  is '���͸�֪���ŵ�״̬��0��δ���͡�1���ѷ���';
comment on column mc.GROUP_ORDER_INFO.user_name
  is '������ǰ��¼�ͻ�����';
comment on column mc.GROUP_ORDER_INFO.prority
  is '�������ȼ�ԽСԽ����';
alter table mc.GROUP_ORDER_INFO
  add constraint PK_GROUP_ORDER_INFO primary key (ORDER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table LOGIN_SMS_VERCODE
prompt ================================
prompt
create table mc.LOGIN_SMS_VERCODE
(
  vercode_id   VARCHAR2(200) not null,
  vercode      VARCHAR2(10) not null,
  mobile_to    VARCHAR2(20) not null,
  user_id      VARCHAR2(200) not null,
  send_msg     VARCHAR2(200),
  send_time    DATE default sysdate,
  vercode_type NUMBER(1) not null,
  remark       VARCHAR2(200),
  status       NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.LOGIN_SMS_VERCODE
  is 'ƽ̨��¼�ֻ���֤���';
comment on column mc.LOGIN_SMS_VERCODE.vercode_id
  is '����';
comment on column mc.LOGIN_SMS_VERCODE.vercode
  is 'ϵͳΪ���ε�¼���ɵ�6λ��֤��';
comment on column mc.LOGIN_SMS_VERCODE.mobile_to
  is '���յ��ֻ���';
comment on column mc.LOGIN_SMS_VERCODE.user_id
  is '�����ֻ���֤����û�ID';
comment on column mc.LOGIN_SMS_VERCODE.send_msg
  is 'Ϊ���ε�¼���͵Ķ�������';
comment on column mc.LOGIN_SMS_VERCODE.send_time
  is '����ʱ��';
comment on column mc.LOGIN_SMS_VERCODE.vercode_type
  is '��֤������ 0���һ�����  1���ֻ���֤���¼';
comment on column mc.LOGIN_SMS_VERCODE.remark
  is '��ע';
comment on column mc.LOGIN_SMS_VERCODE.status
  is '�Ƿ���Ч״ֵ̬  0����Ч  1:��Ч';
alter table mc.LOGIN_SMS_VERCODE
  add constraint VERCODE_ID primary key (VERCODE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MLOG$_ORGANIZATION
prompt =================================
prompt
create table mc.MLOG$_ORGANIZATION
(
  user_id         VARCHAR2(200),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MLOG$_ORGANIZATION
  is 'snapshot log for master table MESSAGECHANNEL.ORGANIZATION';

prompt
prompt Creating table MLOG$_SEND
prompt =========================
prompt
create table mc.MLOG$_SEND
(
  send_id         VARCHAR2(200),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MLOG$_SEND
  is 'snapshot log for master table MESSAGECHANNEL.SEND';

prompt
prompt Creating table MMS_CHANNEL_ANALYZE
prompt ==================================
prompt
create table mc.MMS_CHANNEL_ANALYZE
(
  channel_id    NUMBER(5),
  org_id        VARCHAR2(200),
  stat_time     NUMBER(10),
  status        NUMBER(5),
  quantity      NUMBER(10),
  parent_org_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table MMS_CHANNEL_INFO
prompt ===============================
prompt
create table mc.MMS_CHANNEL_INFO
(
  channel_id     NUMBER(10) not null,
  channel_name   VARCHAR2(500),
  channel_status NUMBER(10),
  channel_remark VARCHAR2(2000),
  sort_id        NUMBER(10),
  channel_state  NUMBER(2),
  com_type       NUMBER(1),
  sp_no_yd       VARCHAR2(50),
  sp_no_lt       VARCHAR2(50),
  sp_no_dx       VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_CHANNEL_INFO
  is '����ͨ����';
comment on column mc.MMS_CHANNEL_INFO.channel_id
  is 'ͨ��ID';
comment on column mc.MMS_CHANNEL_INFO.channel_name
  is 'ͨ������';
comment on column mc.MMS_CHANNEL_INFO.channel_status
  is 'ͨ��״̬��0����,1,ֹͣ,2δ����';
comment on column mc.MMS_CHANNEL_INFO.channel_remark
  is '��ע';
comment on column mc.MMS_CHANNEL_INFO.sort_id
  is 'ͨ������id';
comment on column mc.MMS_CHANNEL_INFO.channel_state
  is 'ͨ������״̬(���ֶ���Ч)';
comment on column mc.MMS_CHANNEL_INFO.com_type
  is '֧�ֺŶ����ͣ�1-ֻ�ƶ�,2-ֻ��ͨ,3-����  0-ȫ֧��';
comment on column mc.MMS_CHANNEL_INFO.sp_no_yd
  is '�ƶ��ط���';
comment on column mc.MMS_CHANNEL_INFO.sp_no_lt
  is '��ͨ�ط���';
comment on column mc.MMS_CHANNEL_INFO.sp_no_dx
  is '�����ط���';
alter table mc.MMS_CHANNEL_INFO
  add constraint PK_MMS_CHANNEL_INFO primary key (CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_CHANNEL_RULE_SET
prompt ===================================
prompt
create table mc.MMS_CHANNEL_RULE_SET
(
  rule_set_id       VARCHAR2(20) not null,
  rule_set_name     VARCHAR2(200),
  rule_set_type     VARCHAR2(20),
  dc_file_path      VARCHAR2(200),
  rule_status       VARCHAR2(20),
  user_organization VARCHAR2(50),
  user_org_name     VARCHAR2(20),
  user_id           VARCHAR2(50),
  user_name         VARCHAR2(20),
  descriptions      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_CHANNEL_RULE_SET
  is '����ͨ�������';
comment on column mc.MMS_CHANNEL_RULE_SET.rule_set_id
  is '������';
comment on column mc.MMS_CHANNEL_RULE_SET.rule_set_name
  is '��������';
comment on column mc.MMS_CHANNEL_RULE_SET.rule_set_type
  is '��������, ITEMS:�ֹ�����Ĺ���, DECISIONTABLE:���߱�';
comment on column mc.MMS_CHANNEL_RULE_SET.dc_file_path
  is '���߱���·��';
comment on column mc.MMS_CHANNEL_RULE_SET.rule_status
  is '״̬, -1:�ݸ�״̬, 0:��ѡ, 1:��Ч';
comment on column mc.MMS_CHANNEL_RULE_SET.user_organization
  is '�������';
comment on column mc.MMS_CHANNEL_RULE_SET.user_org_name
  is '��������';
comment on column mc.MMS_CHANNEL_RULE_SET.user_id
  is '�û����';
comment on column mc.MMS_CHANNEL_RULE_SET.user_name
  is '�û�����';
comment on column mc.MMS_CHANNEL_RULE_SET.descriptions
  is '��ע';
alter table mc.MMS_CHANNEL_RULE_SET
  add constraint PK_MMS_CHANNEL_RULE_SET primary key (RULE_SET_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_CHANNEL_RULE_SET_ITEM
prompt ========================================
prompt
create table mc.MMS_CHANNEL_RULE_SET_ITEM
(
  rule_set_id               VARCHAR2(20),
  rule_set_item_id          VARCHAR2(200) not null,
  rule_set_item_name        VARCHAR2(200),
  salience                  NUMBER(7),
  message_type              VARCHAR2(4000),
  org_id                    VARCHAR2(4000),
  user_id                   VARCHAR2(4000),
  mobile_com                NUMBER(4),
  num_scope                 VARCHAR2(2000),
  num_region                VARCHAR2(2000),
  mobile                    CLOB,
  channel_id                VARCHAR2(200),
  msg_type                  VARCHAR2(40),
  day_start_time            DATE,
  day_end_time              DATE,
  night_start_time          DATE,
  night_end_time            DATE,
  default_channel_id        NUMBER(4),
  default_mobile_channel_id NUMBER(4),
  default_union_channel_id  NUMBER(4),
  default_dx_channel_id     NUMBER(4),
  use_channel_id            NUMBER(4),
  use_status                NUMBER(4)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MMS_CHANNEL_RULE_SET_ITEM
  is '����ͨ���������ϸ��';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.rule_set_id
  is '������';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.rule_set_item_id
  is '������ϸ���';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.rule_set_item_name
  is '������ϸ����';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.salience
  is '���ȼ�';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.message_type
  is '��Ϣ����, ���Զ�ѡ';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.org_id
  is '�������, ���Զ�ѡ';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.user_id
  is '�û����, ���Զ�ѡ';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.mobile_com
  is '��Ӫ��, ���Զ�ѡ';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.num_scope
  is '�Ŷ�, ������д���, ��Ӣ�Ķ��ŷָ�';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.num_region
  is '�ֻ���������, ������д���, ��Ӣ�Ķ��ŷ�';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.mobile
  is '�ֻ�����, ������д���';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.channel_id
  is '��ѡͨ��';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.msg_type
  is '��Ϣ����';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.day_start_time
  is '���쿪ʼʱ��';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.day_end_time
  is '�������ʱ��';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.night_start_time
  is 'ҹ�俪ʼʱ��';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.night_end_time
  is 'ҹ�����ʱ��';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.default_channel_id
  is 'ȱʡʹ�õ�ͨ��';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.default_mobile_channel_id
  is 'ȱʡʹ�õ��ƶ�ͨ��';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.default_union_channel_id
  is 'ȱʡʹ�õ���ͨͨ��';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.default_dx_channel_id
  is 'ȱʡʹ�õĵ���ͨ��';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.use_channel_id
  is '����ʹ�õ�ͨ�����';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.use_status
  is '���ŵ�ȱʡ״̬';
alter table mc.MMS_CHANNEL_RULE_SET_ITEM
  add constraint PK_MMS_CHANNEL_RULE_SET_ITEM primary key (RULE_SET_ITEM_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_HIS
prompt ======================
prompt
create table mc.MMS_HIS
(
  mms_his_id        VARCHAR2(200) not null,
  send_status       NUMBER(2),
  user_organization VARCHAR2(200),
  channel_id        NUMBER(4),
  mobile_com        NUMBER(2),
  sys_id            VARCHAR2(200),
  message_type      VARCHAR2(200),
  batch_id          VARCHAR2(200),
  mobile_quantities NUMBER(4),
  send_time         DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MMS_HIS
  is '���Ź鵵��';
comment on column mc.MMS_HIS.mms_his_id
  is 'id';
comment on column mc.MMS_HIS.send_status
  is '����״̬';
comment on column mc.MMS_HIS.user_organization
  is '����';
comment on column mc.MMS_HIS.channel_id
  is 'ͨ��';
comment on column mc.MMS_HIS.mobile_com
  is '��Ӫ��';
comment on column mc.MMS_HIS.sys_id
  is '��Ϣ��Դ';
comment on column mc.MMS_HIS.message_type
  is '��Ϣ����';
comment on column mc.MMS_HIS.batch_id
  is '���κ�';
comment on column mc.MMS_HIS.mobile_quantities
  is '��������';
comment on column mc.MMS_HIS.send_time
  is '����ʱ��';
alter table mc.MMS_HIS
  add constraint PK_MMS_HIS primary key (MMS_HIS_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_RECEIVE
prompt ==========================
prompt
create table mc.MMS_RECEIVE
(
  receive_id      VARCHAR2(200) not null,
  mobile_from     VARCHAR2(30),
  subject         VARCHAR2(40),
  receive_msg     BLOB,
  receive_time    DATE,
  sp_no           VARCHAR2(20),
  sp_serv_no      VARCHAR2(20),
  receive_status  NUMBER(1),
  read_time       DATE,
  channel_id      NUMBER(2),
  organization_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MMS_RECEIVE
  is '����������Ϣ��';
comment on column mc.MMS_RECEIVE.receive_id
  is '���в��ű��';
comment on column mc.MMS_RECEIVE.mobile_from
  is '�����ֻ���';
comment on column mc.MMS_RECEIVE.subject
  is '���ű���';
comment on column mc.MMS_RECEIVE.receive_msg
  is '��������';
comment on column mc.MMS_RECEIVE.receive_time
  is '����ʱ��';
comment on column mc.MMS_RECEIVE.sp_no
  is '�ط���';
comment on column mc.MMS_RECEIVE.sp_serv_no
  is 'ҵ����';
comment on column mc.MMS_RECEIVE.receive_status
  is '����״̬';
comment on column mc.MMS_RECEIVE.read_time
  is '�Ķ�ʱ��';
comment on column mc.MMS_RECEIVE.channel_id
  is 'ͨ�����';
comment on column mc.MMS_RECEIVE.organization_id
  is '��������';
alter table mc.MMS_RECEIVE
  add constraint PK_MMS_RECEIVE primary key (RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_SCHED_MOBILE_TEMP
prompt ====================================
prompt
create table mc.MMS_SCHED_MOBILE_TEMP
(
  schedule_id VARCHAR2(200) not null,
  mobile      VARCHAR2(20) not null,
  import_type VARCHAR2(200),
  batch_id    VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MMS_SCHED_MOBILE_TEMP
  is '���ŷ��͵����ֻ��ŵ���ʱ��';
comment on column mc.MMS_SCHED_MOBILE_TEMP.schedule_id
  is '���ŷ��ͼ�¼���';
comment on column mc.MMS_SCHED_MOBILE_TEMP.mobile
  is '�ֻ�����';
comment on column mc.MMS_SCHED_MOBILE_TEMP.import_type
  is '���뷽ʽ';
comment on column mc.MMS_SCHED_MOBILE_TEMP.batch_id
  is '��������, ����ͳ�Ƶ�������';
alter table mc.MMS_SCHED_MOBILE_TEMP
  add constraint PK_MMS_SCHED_MOBILE_TEMP primary key (SCHEDULE_ID, MOBILE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_SEND
prompt =======================
prompt
create table mc.MMS_SEND
(
  mms_send_id          NUMBER(32) not null,
  subject              VARCHAR2(100),
  mobile_to            VARCHAR2(20),
  ext_num              VARCHAR2(20),
  prior_id             NUMBER(1) default 8,
  send_status          NUMBER(1),
  sys_time             DATE default sysdate,
  sys_date_id          NUMBER(18),
  pre_send_time        DATE,
  event_latest_time    DATE,
  morning_earlest_time DATE,
  morning_latest_time  DATE,
  send_time            DATE default sysdate,
  send_date_id         NUMBER(18),
  com_rtn_time         DATE,
  err_msg              VARCHAR2(100),
  fail_resend_times    NUMBER(1) default 0,
  err_id               VARCHAR2(20),
  report_time          DATE,
  gw_send_time         DATE,
  gw_report_time       DATE,
  channel_id           NUMBER(4),
  mobile_quantities    NUMBER(4),
  resend_times         NUMBER(1) default 0,
  org_name             VARCHAR2(40),
  org_id               VARCHAR2(50),
  user_id              VARCHAR2(40),
  user_name            VARCHAR2(40),
  batch_id             VARCHAR2(40),
  gw_batch             VARCHAR2(40),
  sequence             VARCHAR2(40),
  send_type            NUMBER(4),
  mobile_com           NUMBER(2),
  message_type         VARCHAR2(20),
  sys_id               VARCHAR2(10),
  msg_id               VARCHAR2(80),
  sender_id            VARCHAR2(100),
  remark               VARCHAR2(500)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_SEND
  is '���в�����Ϣ��';
comment on column mc.MMS_SEND.mms_send_id
  is '���ű��';
comment on column mc.MMS_SEND.subject
  is '���ű���';
comment on column mc.MMS_SEND.mobile_to
  is '�ֻ���';
comment on column mc.MMS_SEND.ext_num
  is '��չ����';
comment on column mc.MMS_SEND.prior_id
  is '���ȼ�';
comment on column mc.MMS_SEND.send_status
  is '����״̬, -2:������, 0,δ����, 1:���ύ, 2:������, 5:���ͳɹ�, 6:����ʧ��, 7:ϵͳ������';
comment on column mc.MMS_SEND.sys_time
  is '���ʱ��';
comment on column mc.MMS_SEND.sys_date_id
  is '�����������';
comment on column mc.MMS_SEND.pre_send_time
  is 'Ԥ�Ʒ���ʱ��';
comment on column mc.MMS_SEND.event_latest_time
  is '���������ʱ��';
comment on column mc.MMS_SEND.morning_earlest_time
  is '�糿���緢��ʱ��';
comment on column mc.MMS_SEND.morning_latest_time
  is '�糿������ʱ��';
comment on column mc.MMS_SEND.send_time
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column mc.MMS_SEND.send_date_id
  is 'ƽ̨���Ͳ��ŵ�����';
comment on column mc.MMS_SEND.com_rtn_time
  is '���ͺ��ƶ�����ͨ���ط��ؽ����ʱ��';
comment on column mc.MMS_SEND.err_msg
  is '����ʧ��ʱ����Ӫ�����ط��صĴ�����Ϣ��ֻ���ڷ���ʧ��ʱ�����ֶ���ֵ������ʱ��δ��';
comment on column mc.MMS_SEND.fail_resend_times
  is '����ʧ�ܴ���';
comment on column mc.MMS_SEND.err_id
  is '������룬������Ϣƽ̨�������Ͳ������ش������';
comment on column mc.MMS_SEND.report_time
  is '�ֻ�����״̬���淵��ʱ��';
comment on column mc.MMS_SEND.gw_send_time
  is '���ط��Ͳ���ʱ��';
comment on column mc.MMS_SEND.gw_report_time
  is '���ؽ���״̬����ʱ��';
comment on column mc.MMS_SEND.channel_id
  is 'ͨ�����';
comment on column mc.MMS_SEND.mobile_quantities
  is '������Ϣ���ֻ�����';
comment on column mc.MMS_SEND.resend_times
  is '�ط�����';
comment on column mc.MMS_SEND.org_name
  is '��������';
comment on column mc.MMS_SEND.org_id
  is '�������';
comment on column mc.MMS_SEND.user_id
  is '�û����';
comment on column mc.MMS_SEND.user_name
  is '�û�����';
comment on column mc.MMS_SEND.batch_id
  is '��������';
comment on column mc.MMS_SEND.gw_batch
  is '�������ط��ص�����';
comment on column mc.MMS_SEND.sequence
  is '�������ط��صĲ��ű��';
comment on column mc.MMS_SEND.send_type
  is '��������';
comment on column mc.MMS_SEND.mobile_com
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ,3:����,0:�������';
comment on column mc.MMS_SEND.message_type
  is '��Ϣ����';
comment on column mc.MMS_SEND.sys_id
  is 'ҵ��ϵͳ�ı��, ���ڱ�ʶ���������ĸ�ҵ��ϵͳ�ı�� ������д������ERR_ID�ֶ���ʾ1010����)';
comment on column mc.MMS_SEND.msg_id
  is '���ɲ��ŵ�ҵ��ϵͳ�Ĳ��ű��';
comment on column mc.MMS_SEND.sender_id
  is '�ӿ��û����';
comment on column mc.MMS_SEND.remark
  is '��ע��Ϣ�������ֶΣ���չʱʹ��';
alter table mc.MMS_SEND
  add constraint PK_MMS_SEND primary key (MMS_SEND_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_MMSSEND_SEND_TIME on mc.MMS_SEND (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_SEND_ANALYZE
prompt ===============================
prompt
create table mc.MMS_SEND_ANALYZE
(
  org_id        VARCHAR2(200),
  user_id       VARCHAR2(200),
  stat_time     NUMBER(10),
  status        NUMBER(5),
  quantity      NUMBER(10),
  parent_org_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table MMS_SEND_CONTENT
prompt ===============================
prompt
create table mc.MMS_SEND_CONTENT
(
  batch_id          VARCHAR2(200) not null,
  subject           VARCHAR2(200),
  sys_time          DATE,
  send_msg          CLOB,
  user_organization VARCHAR2(200),
  user_org_name     VARCHAR2(200),
  user_id           VARCHAR2(200),
  user_name         VARCHAR2(200),
  sender_id         VARCHAR2(200),
  gw_mms_id         VARCHAR2(200),
  gw_mms_id1        VARCHAR2(200),
  gw_mms_id2        VARCHAR2(200),
  gw_mms_id3        VARCHAR2(200),
  gw_mms_id4        VARCHAR2(200),
  gw_mms_id5        VARCHAR2(200),
  gw_mms_id6        VARCHAR2(200),
  gw_mms_id7        VARCHAR2(200),
  gw_mms_id8        VARCHAR2(200),
  gw_mms_id9        VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_SEND_CONTENT
  is '���ŷ������ݱ�';
comment on column mc.MMS_SEND_CONTENT.batch_id
  is '����';
comment on column mc.MMS_SEND_CONTENT.subject
  is '���ű���';
comment on column mc.MMS_SEND_CONTENT.sys_time
  is '���ʱ��';
comment on column mc.MMS_SEND_CONTENT.send_msg
  is '��������';
comment on column mc.MMS_SEND_CONTENT.user_organization
  is '�������';
comment on column mc.MMS_SEND_CONTENT.user_org_name
  is '��������';
comment on column mc.MMS_SEND_CONTENT.user_id
  is '�û����';
comment on column mc.MMS_SEND_CONTENT.user_name
  is '�û�����';
comment on column mc.MMS_SEND_CONTENT.sender_id
  is '�ӿ��û����';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id
  is '���ط��صĲ��ű��';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id1
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id2
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id3
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id4
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id5
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id6
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id7
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id8
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id9
  is '���ط��صĲ��ű��(�����ֶ�)';
alter table mc.MMS_SEND_CONTENT
  add constraint PK_MMS_SEND_CONTENT primary key (BATCH_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_SEND_HIS
prompt ===========================
prompt
create table mc.MMS_SEND_HIS
(
  mms_send_id          NUMBER(32) not null,
  subject              VARCHAR2(100),
  mobile_to            VARCHAR2(20),
  ext_num              VARCHAR2(20),
  prior_id             NUMBER(1) default 8,
  send_status          NUMBER(1),
  sys_time             DATE default sysdate,
  sys_date_id          NUMBER(18),
  pre_send_time        DATE,
  event_latest_time    DATE,
  morning_earlest_time DATE,
  morning_latest_time  DATE,
  send_time            DATE default sysdate,
  send_date_id         NUMBER(18),
  com_rtn_time         DATE,
  err_msg              VARCHAR2(100),
  fail_resend_times    NUMBER(1) default 0,
  err_id               VARCHAR2(20),
  report_time          DATE,
  gw_send_time         DATE,
  gw_report_time       DATE,
  channel_id           NUMBER(4),
  mobile_quantities    NUMBER(4),
  resend_times         NUMBER(1) default 0,
  org_name             VARCHAR2(40),
  org_id               VARCHAR2(50),
  user_id              VARCHAR2(40),
  user_name            VARCHAR2(40),
  batch_id             VARCHAR2(40),
  gw_batch             VARCHAR2(40),
  sequence             VARCHAR2(40),
  send_type            NUMBER(4),
  mobile_com           NUMBER(2),
  message_type         VARCHAR2(20),
  sys_id               VARCHAR2(10),
  msg_id               VARCHAR2(80),
  sender_id            VARCHAR2(100),
  remark               VARCHAR2(500)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MMS_SEND_HIS
  is '���в�����Ϣ��';
comment on column mc.MMS_SEND_HIS.mms_send_id
  is '���ű��';
comment on column mc.MMS_SEND_HIS.subject
  is '���ű���';
comment on column mc.MMS_SEND_HIS.mobile_to
  is '�ֻ���';
comment on column mc.MMS_SEND_HIS.ext_num
  is '��չ����';
comment on column mc.MMS_SEND_HIS.prior_id
  is '���ȼ�';
comment on column mc.MMS_SEND_HIS.send_status
  is '����״̬, -2:������, 0,δ����, 1:���ύ, 2:������, 5:���ͳɹ�, 6:����ʧ��, 7:ϵͳ������';
comment on column mc.MMS_SEND_HIS.sys_time
  is '���ʱ��';
comment on column mc.MMS_SEND_HIS.sys_date_id
  is '�����������';
comment on column mc.MMS_SEND_HIS.pre_send_time
  is 'Ԥ�Ʒ���ʱ��';
comment on column mc.MMS_SEND_HIS.event_latest_time
  is '���������ʱ��';
comment on column mc.MMS_SEND_HIS.morning_earlest_time
  is '�糿���緢��ʱ��';
comment on column mc.MMS_SEND_HIS.morning_latest_time
  is '�糿������ʱ��';
comment on column mc.MMS_SEND_HIS.send_time
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column mc.MMS_SEND_HIS.send_date_id
  is 'ƽ̨���Ͳ��ŵ�����';
comment on column mc.MMS_SEND_HIS.com_rtn_time
  is '���ͺ��ƶ�����ͨ���ط��ؽ����ʱ��';
comment on column mc.MMS_SEND_HIS.err_msg
  is '����ʧ��ʱ����Ӫ�����ط��صĴ�����Ϣ��ֻ���ڷ���ʧ��ʱ�����ֶ���ֵ������ʱ��δ��';
comment on column mc.MMS_SEND_HIS.fail_resend_times
  is '����ʧ�ܴ���';
comment on column mc.MMS_SEND_HIS.err_id
  is '������룬������Ϣƽ̨�������Ͳ������ش������';
comment on column mc.MMS_SEND_HIS.report_time
  is '�ֻ�����״̬���淵��ʱ��';
comment on column mc.MMS_SEND_HIS.gw_send_time
  is '���ط��Ͳ���ʱ��';
comment on column mc.MMS_SEND_HIS.gw_report_time
  is '���ؽ���״̬����ʱ��';
comment on column mc.MMS_SEND_HIS.channel_id
  is 'ͨ�����';
comment on column mc.MMS_SEND_HIS.mobile_quantities
  is '������Ϣ���ֻ�����';
comment on column mc.MMS_SEND_HIS.resend_times
  is '�ط�����';
comment on column mc.MMS_SEND_HIS.org_name
  is '��������';
comment on column mc.MMS_SEND_HIS.org_id
  is '�������';
comment on column mc.MMS_SEND_HIS.user_id
  is '�û����';
comment on column mc.MMS_SEND_HIS.user_name
  is '�û�����';
comment on column mc.MMS_SEND_HIS.batch_id
  is '��������';
comment on column mc.MMS_SEND_HIS.gw_batch
  is '�������ط��ص�����';
comment on column mc.MMS_SEND_HIS.sequence
  is '�������ط��صĲ��ű��';
comment on column mc.MMS_SEND_HIS.send_type
  is '��������';
comment on column mc.MMS_SEND_HIS.mobile_com
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ,3:����,0:�������';
comment on column mc.MMS_SEND_HIS.message_type
  is '��Ϣ����';
comment on column mc.MMS_SEND_HIS.sys_id
  is 'ҵ��ϵͳ�ı��, ���ڱ�ʶ���������ĸ�ҵ��ϵͳ�ı�� ������д������ERR_ID�ֶ���ʾ1010����)';
comment on column mc.MMS_SEND_HIS.msg_id
  is '���ɲ��ŵ�ҵ��ϵͳ�Ĳ��ű��';
comment on column mc.MMS_SEND_HIS.sender_id
  is '�ӿ��û����';
comment on column mc.MMS_SEND_HIS.remark
  is '��ע��Ϣ�������ֶΣ���չʱʹ��';
alter table mc.MMS_SEND_HIS
  add constraint PK_MMS_SEND_HIS primary key (MMS_SEND_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_MMSSENDHIS_SEND_TIME on mc.MMS_SEND_HIS (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_SEND_SCHEDULE
prompt ================================
prompt
create table mc.MMS_SEND_SCHEDULE
(
  mms_send_schedule_id VARCHAR2(200) not null,
  mms_template_id      VARCHAR2(200),
  subject              VARCHAR2(200),
  mobile_to            CLOB,
  groups               CLOB,
  groups_name          CLOB,
  data_file            BLOB,
  data_file_type       VARCHAR2(20),
  send_msg             CLOB,
  prior_id             NUMBER(1),
  send_status          NUMBER(1),
  sys_time             DATE,
  pre_send_time        DATE,
  channel_id           NUMBER(4),
  mobile_quantities    NUMBER(7),
  temp_temp            BLOB,
  temp_msg             BLOB,
  param_map            BLOB,
  mobile_list_id       VARCHAR2(200),
  user_organization    VARCHAR2(200),
  user_org_name        VARCHAR2(200),
  user_id              VARCHAR2(200),
  user_name            VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_SEND_SCHEDULE
  is '���ŷ��ͼ�¼��';
comment on column mc.MMS_SEND_SCHEDULE.mms_send_schedule_id
  is '���';
comment on column mc.MMS_SEND_SCHEDULE.mms_template_id
  is 'ģ����';
comment on column mc.MMS_SEND_SCHEDULE.subject
  is '���ű���';
comment on column mc.MMS_SEND_SCHEDULE.mobile_to
  is '�ֻ���,�Զ��ŷָ�';
comment on column mc.MMS_SEND_SCHEDULE.groups
  is '�ͻ�Ⱥ��, ��Ӣ�ķֺŷָ�';
comment on column mc.MMS_SEND_SCHEDULE.groups_name
  is '�ͻ�������, ��Ӣ�ķֺŷָ�';
comment on column mc.MMS_SEND_SCHEDULE.data_file
  is '�ֻ������ļ�';
comment on column mc.MMS_SEND_SCHEDULE.data_file_type
  is '�����ļ�����';
comment on column mc.MMS_SEND_SCHEDULE.send_msg
  is '��������';
comment on column mc.MMS_SEND_SCHEDULE.prior_id
  is '���ȼ�';
comment on column mc.MMS_SEND_SCHEDULE.send_status
  is '����״̬, -2:������, 0:������, 1:�ѷ���, 2:������, 5:���ͳɹ�, 6:����ʧ��, 7:������';
comment on column mc.MMS_SEND_SCHEDULE.sys_time
  is '���ʱ��';
comment on column mc.MMS_SEND_SCHEDULE.pre_send_time
  is 'Ԥ������ʱ��';
comment on column mc.MMS_SEND_SCHEDULE.channel_id
  is 'ͨ�����';
comment on column mc.MMS_SEND_SCHEDULE.mobile_quantities
  is '������Ϣ���ֻ�����';
comment on column mc.MMS_SEND_SCHEDULE.temp_temp
  is '����ģ������';
comment on column mc.MMS_SEND_SCHEDULE.temp_msg
  is '�����������';
comment on column mc.MMS_SEND_SCHEDULE.param_map
  is '�ύ��Ϣʱ��Ĳ���';
comment on column mc.MMS_SEND_SCHEDULE.mobile_list_id
  is '�����ֻ�����Ķ���';
comment on column mc.MMS_SEND_SCHEDULE.user_organization
  is '�������';
comment on column mc.MMS_SEND_SCHEDULE.user_org_name
  is '��������';
comment on column mc.MMS_SEND_SCHEDULE.user_id
  is '�û����';
comment on column mc.MMS_SEND_SCHEDULE.user_name
  is '�û�����';
alter table mc.MMS_SEND_SCHEDULE
  add constraint PK_MMS_SEND_SCHEDULE primary key (MMS_SEND_SCHEDULE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_STOCK_PAPER
prompt ==============================
prompt
create table mc.MMS_STOCK_PAPER
(
  mms_stock_paper_id  NUMBER(18) not null,
  product_id          VARCHAR2(50),
  status              NUMBER(18),
  user_id             VARCHAR2(50),
  user_name           VARCHAR2(50),
  organization_id     VARCHAR2(50),
  organization_name   VARCHAR2(50),
  create_time         DATE,
  audit_time          DATE,
  send_time           DATE,
  title               VARCHAR2(50),
  send_msg            CLOB,
  mms_content         CLOB,
  subscribe_number    NUMBER(18),
  edit_headtail_frame VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MMS_STOCK_PAPER
  add constraint PK_MMS_STOCK_PAPER primary key (MMS_STOCK_PAPER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_TEMPLATE
prompt ===========================
prompt
create table mc.MMS_TEMPLATE
(
  mms_template_id   VARCHAR2(200) not null,
  subject           VARCHAR2(200),
  frame_size        NUMBER(19),
  content_size      NUMBER(19),
  duration          NUMBER(19),
  user_organization VARCHAR2(200),
  user_org_name     VARCHAR2(200),
  user_id           VARCHAR2(200),
  user_name         VARCHAR2(200),
  is_default        VARCHAR2(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_TEMPLATE
  is '����ģ��';
comment on column mc.MMS_TEMPLATE.mms_template_id
  is 'ģ����';
comment on column mc.MMS_TEMPLATE.subject
  is '���ű���';
comment on column mc.MMS_TEMPLATE.frame_size
  is '֡��';
comment on column mc.MMS_TEMPLATE.content_size
  is '���Ŵ�С';
comment on column mc.MMS_TEMPLATE.duration
  is '����ʱ��, ��λ:��';
comment on column mc.MMS_TEMPLATE.user_organization
  is '�������';
comment on column mc.MMS_TEMPLATE.user_org_name
  is '��������';
comment on column mc.MMS_TEMPLATE.user_id
  is '�û����';
comment on column mc.MMS_TEMPLATE.user_name
  is '�û�����';
comment on column mc.MMS_TEMPLATE.is_default
  is '�Ƿ���ȱʡģ��';
alter table mc.MMS_TEMPLATE
  add constraint PK_MMS_TEMPLATE primary key (MMS_TEMPLATE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_TMPL_FRAME
prompt =============================
prompt
create table mc.MMS_TMPL_FRAME
(
  mms_tmpl_frame_id VARCHAR2(200) not null,
  mms_template_id   VARCHAR2(200),
  sequence_id       VARCHAR2(20),
  duration          NUMBER(19),
  frame_size        NUMBER(19),
  picture_name      VARCHAR2(200),
  picture_type      VARCHAR2(8),
  picture_size      NUMBER(19),
  picture_file      BLOB,
  audio_name        VARCHAR2(200),
  audio_type        VARCHAR2(8),
  audio_size        NUMBER(19),
  audio_file        BLOB,
  message_content   VARCHAR2(4000),
  message_size      NUMBER(19),
  message_location  VARCHAR2(8)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_TMPL_FRAME
  is '����ģ���е�֡';
comment on column mc.MMS_TMPL_FRAME.mms_tmpl_frame_id
  is '֡���';
comment on column mc.MMS_TMPL_FRAME.mms_template_id
  is 'ģ����';
comment on column mc.MMS_TMPL_FRAME.sequence_id
  is '˳���';
comment on column mc.MMS_TMPL_FRAME.duration
  is '����ʱ��, ��λ:��';
comment on column mc.MMS_TMPL_FRAME.frame_size
  is '֡�Ĵ�С';
comment on column mc.MMS_TMPL_FRAME.picture_name
  is 'ͼƬ����';
comment on column mc.MMS_TMPL_FRAME.picture_type
  is 'ͼƬ����';
comment on column mc.MMS_TMPL_FRAME.picture_size
  is 'ͼƬ��С';
comment on column mc.MMS_TMPL_FRAME.picture_file
  is 'ͼƬ�ļ�';
comment on column mc.MMS_TMPL_FRAME.audio_name
  is '��������';
comment on column mc.MMS_TMPL_FRAME.audio_type
  is '��������';
comment on column mc.MMS_TMPL_FRAME.audio_size
  is '���ִ�С';
comment on column mc.MMS_TMPL_FRAME.audio_file
  is '�����ļ�';
comment on column mc.MMS_TMPL_FRAME.message_content
  is '��������';
comment on column mc.MMS_TMPL_FRAME.message_size
  is '���ִ�С';
comment on column mc.MMS_TMPL_FRAME.message_location
  is '����λ��, TOP:�Ϸ�, BOTTOM:�·�';
alter table mc.MMS_TMPL_FRAME
  add constraint PK_MMS_TMPL_FRAME primary key (MMS_TMPL_FRAME_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.MMS_TMPL_FRAME
  add constraint FK_MMS_TMPL_FRAME foreign key (MMS_TEMPLATE_ID)
  references mc.MMS_TEMPLATE (MMS_TEMPLATE_ID);

prompt
prompt Creating table MOBILENUM_REGION
prompt ===============================
prompt
create table mc.MOBILENUM_REGION
(
  numscope   VARCHAR2(20) not null,
  province   VARCHAR2(60),
  city       VARCHAR2(50),
  card_type  VARCHAR2(200),
  region_num VARCHAR2(2000)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILENUM_REGION
  is '�ֻ��Ŷι����ر�';
comment on column mc.MOBILENUM_REGION.numscope
  is '�ֻ��Ŷ�';
comment on column mc.MOBILENUM_REGION.province
  is '�ֻ��Ŷ�����ʡ';
comment on column mc.MOBILENUM_REGION.city
  is '�ֻ��Ŷ���������';
comment on column mc.MOBILENUM_REGION.card_type
  is '�ֻ�������';
comment on column mc.MOBILENUM_REGION.region_num
  is '��������';
alter table mc.MOBILENUM_REGION
  add constraint PK_MOBILENUM_REGION primary key (NUMSCOPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_COM
prompt =========================
prompt
create table mc.MOBILE_COM
(
  numscope   VARCHAR2(50) not null,
  mobile_com NUMBER(4)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MOBILE_COM
  is '�ֻ��Ŷ�������Ӫ�̱�������ֵ��';
comment on column mc.MOBILE_COM.numscope
  is '�ֻ��Ŷ�';
comment on column mc.MOBILE_COM.mobile_com
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ, 3:����';
alter table mc.MOBILE_COM
  add constraint PK_MOBILE_COM primary key (NUMSCOPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MOBILE_EXCEL_INFO
prompt ================================
prompt
create table mc.MOBILE_EXCEL_INFO
(
  excel_id   VARCHAR2(200) not null,
  excel_name VARCHAR2(200),
  mobile     VARCHAR2(2000) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MOBILE_EXCEL_INFO
  add constraint PK_MOBILE_EXCEL_INFO primary key (EXCEL_ID, MOBILE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_INVALID
prompt =============================
prompt
create table mc.MOBILE_INVALID
(
  mobile_id     VARCHAR2(50) not null,
  mobile        VARCHAR2(50),
  mobile_type   VARCHAR2(50),
  mobile_remark VARCHAR2(50),
  create_time   DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_INVALID
  is '��Ч�ֻ�����';
comment on column mc.MOBILE_INVALID.mobile_id
  is '��Ч�ֻ��ű������';
comment on column mc.MOBILE_INVALID.mobile
  is '��Ч�ֻ���';
comment on column mc.MOBILE_INVALID.mobile_type
  is '����, 1:����, 2:����';
comment on column mc.MOBILE_INVALID.mobile_remark
  is '��Ч�ֻ��ŵ�ע��';
comment on column mc.MOBILE_INVALID.create_time
  is '�����Ч�ֻ���ʱ��ʱ��';
alter table mc.MOBILE_INVALID
  add constraint PK_MOBILE_INVALID primary key (MOBILE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_TEMP
prompt ==========================
prompt
create table mc.MOBILE_TEMP
(
  mobile VARCHAR2(2000) not null,
  type   VARCHAR2(2000)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_TEMP
  is '�ֻ�������ʱ��ű�';
comment on column mc.MOBILE_TEMP.mobile
  is '�ֻ���';
comment on column mc.MOBILE_TEMP.type
  is '����';
alter table mc.MOBILE_TEMP
  add constraint PK_MOBILE_TEMP primary key (MOBILE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_TO_OPERATORS
prompt ==================================
prompt
create table mc.MOBILE_TO_OPERATORS
(
  mobile     VARCHAR2(20) not null,
  mobile_com NUMBER(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_TO_OPERATORS
  is 'ά������ת�������';
comment on column mc.MOBILE_TO_OPERATORS.mobile
  is '�ֻ���';
comment on column mc.MOBILE_TO_OPERATORS.mobile_com
  is '��Ӫ�̱��, 1:�ƶ�,2:��ͨ, 3:����';
alter table mc.MOBILE_TO_OPERATORS
  add constraint PK_MOBILE_TO_OPERATORS primary key (MOBILE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_WHITE_LIST
prompt ================================
prompt
create table mc.MOBILE_WHITE_LIST
(
  white_list_id VARCHAR2(200) not null,
  mobile        VARCHAR2(200),
  mobile_com    NUMBER(2),
  batch_id      VARCHAR2(200),
  create_time   DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_WHITE_LIST
  is '���еİ�����';
comment on column mc.MOBILE_WHITE_LIST.white_list_id
  is '���������';
comment on column mc.MOBILE_WHITE_LIST.mobile
  is '�ֻ�����';
comment on column mc.MOBILE_WHITE_LIST.mobile_com
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ, 3:����';
comment on column mc.MOBILE_WHITE_LIST.batch_id
  is '����';
comment on column mc.MOBILE_WHITE_LIST.create_time
  is 'ʱ��';
alter table mc.MOBILE_WHITE_LIST
  add constraint PK_MOBILE_WHITE_LIST primary key (WHITE_LIST_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index mc.IDX_WHITE_MOBILE on mc.MOBILE_WHITE_LIST (MOBILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_WHITE_LIST_CHANNEL
prompt ========================================
prompt
create table mc.MOBILE_WHITE_LIST_CHANNEL
(
  white_list_channel_id VARCHAR2(200) not null,
  mobile                VARCHAR2(200),
  channel_id            NUMBER(4),
  status                NUMBER(4),
  create_time           DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_WHITE_LIST_CHANNEL
  is 'ͨ���İ�����';
comment on column mc.MOBILE_WHITE_LIST_CHANNEL.white_list_channel_id
  is '���������';
comment on column mc.MOBILE_WHITE_LIST_CHANNEL.mobile
  is '�ֻ�����';
comment on column mc.MOBILE_WHITE_LIST_CHANNEL.channel_id
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ, 3:����';
comment on column mc.MOBILE_WHITE_LIST_CHANNEL.status
  is '״̬, 0:δͬ�����ƶ���ͨ��, 1:ͬ���ɹ�, -1:ͬ��ʧ��';
comment on column mc.MOBILE_WHITE_LIST_CHANNEL.create_time
  is '����ʱ��';
alter table mc.MOBILE_WHITE_LIST_CHANNEL
  add constraint PK_MOBILE_WHITE_LIST_CHANNEL primary key (WHITE_LIST_CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index mc.IDX_WHITE_MOBILE_CHANNEL on mc.MOBILE_WHITE_LIST_CHANNEL (MOBILE, CHANNEL_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_WHITE_LIST_CONFIG
prompt =======================================
prompt
create table mc.MOBILE_WHITE_LIST_CONFIG
(
  config_key   VARCHAR2(200) not null,
  config_value VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_WHITE_LIST_CONFIG
  is '������������ñ�';
comment on column mc.MOBILE_WHITE_LIST_CONFIG.config_key
  is '������';
comment on column mc.MOBILE_WHITE_LIST_CONFIG.config_value
  is '����ֵ';
alter table mc.MOBILE_WHITE_LIST_CONFIG
  add constraint PK_MOBILE_WHITE_LIST_CONFIG primary key (CONFIG_KEY)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MONITOR_DETAIL
prompt =============================
prompt
create table mc.MONITOR_DETAIL
(
  id             VARCHAR2(200) not null,
  not_sendcount  VARCHAR2(20),
  submitedcount  VARCHAR2(20),
  send_succount  VARCHAR2(20),
  send_failcount VARCHAR2(20),
  sys_time       VARCHAR2(50),
  mo_count       VARCHAR2(20),
  channel        VARCHAR2(20),
  speed          VARCHAR2(20),
  create_time    DATE default sysdate
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MONITOR_DETAIL
  is '���������ϸ��,��Ҫ���ڲ�ѯ֮ǰ������ͼ��ѯ';
comment on column mc.MONITOR_DETAIL.id
  is 'ϵͳid';
comment on column mc.MONITOR_DETAIL.not_sendcount
  is '������������(״̬����0,2)';
comment on column mc.MONITOR_DETAIL.submitedcount
  is '���ύ��������';
comment on column mc.MONITOR_DETAIL.send_succount
  is '�ɹ���������';
comment on column mc.MONITOR_DETAIL.send_failcount
  is 'ʧ�ܶ�������(״̬����6,7,8)';
comment on column mc.MONITOR_DETAIL.sys_time
  is '��ȡ��Ϣ��ʱ��';
comment on column mc.MONITOR_DETAIL.mo_count
  is '���ж��ŵ�����';
comment on column mc.MONITOR_DETAIL.channel
  is 'ͨ������';
comment on column mc.MONITOR_DETAIL.speed
  is '�ٶ�';
comment on column mc.MONITOR_DETAIL.create_time
  is '����ʱ��';
alter table mc.MONITOR_DETAIL
  add constraint PK_MONITOR_DETAIL primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MONTH_MAIN_INFO
prompt ==============================
prompt
create table mc.MONTH_MAIN_INFO
(
  month_main_info_id VARCHAR2(200) not null,
  user_id            VARCHAR2(200),
  user_type          NUMBER(1),
  remain_quota       NUMBER(22),
  remain_fee         FLOAT,
  month_payment      VARCHAR2(200),
  time               VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.MONTH_MAIN_INFO
  add primary key (MONTH_MAIN_INFO_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MONTH_RECKONING_INFO
prompt ===================================
prompt
create table mc.MONTH_RECKONING_INFO
(
  month_reckoning_id  VARCHAR2(200) not null,
  user_id             VARCHAR2(200),
  organization_id     VARCHAR2(200),
  month_payment       NUMBER(9,2),
  month_begin_balance NUMBER(9,2),
  month_end_balance   NUMBER(9,2),
  send_quantity       NUMBER(9),
  cost_fee            NUMBER(9,2),
  record_date         DATE default sysdate,
  inner_payment       NUMBER(9,2) default 0.00,
  mobile_com          NUMBER(2),
  channel_id          NUMBER(4),
  account_time        VARCHAR2(20),
  unit_price          NUMBER(10,3)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MONTH_RECKONING_INFO
  is '�½ᵥ��';
comment on column mc.MONTH_RECKONING_INFO.month_reckoning_id
  is 'id';
comment on column mc.MONTH_RECKONING_INFO.user_id
  is '�˻�id';
comment on column mc.MONTH_RECKONING_INFO.organization_id
  is '��������';
comment on column mc.MONTH_RECKONING_INFO.month_payment
  is '���ڳ�ֵ';
comment on column mc.MONTH_RECKONING_INFO.month_begin_balance
  is '����˻����';
comment on column mc.MONTH_RECKONING_INFO.month_end_balance
  is '��ĩ�˻����';
comment on column mc.MONTH_RECKONING_INFO.send_quantity
  is '���·�������';
comment on column mc.MONTH_RECKONING_INFO.cost_fee
  is '���úϼ�';
comment on column mc.MONTH_RECKONING_INFO.record_date
  is '��¼ʱ��';
comment on column mc.MONTH_RECKONING_INFO.inner_payment
  is '�����˻���ֵ';
comment on column mc.MONTH_RECKONING_INFO.mobile_com
  is '��Ӫ��ID��1Ϊ�ƶ���2Ϊ��ͨ,3Ϊ����,0Ϊȫ�� ';
comment on column mc.MONTH_RECKONING_INFO.channel_id
  is 'ͨ��ID';
comment on column mc.MONTH_RECKONING_INFO.account_time
  is '��������';
comment on column mc.MONTH_RECKONING_INFO.unit_price
  is '���ŵ���';
alter table mc.MONTH_RECKONING_INFO
  add constraint PK_MONTH_RECKONING_INFO primary key (MONTH_RECKONING_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MO_BIZ
prompt =====================
prompt
create table mc.MO_BIZ
(
  mo_biz_id      VARCHAR2(100) not null,
  mo_biz_name    VARCHAR2(100),
  is_default_biz NUMBER(1),
  mo_type        VARCHAR2(20),
  sms_command    VARCHAR2(100),
  ext_number     VARCHAR2(100),
  parent_biz_id  VARCHAR2(100),
  node_type      VARCHAR2(100),
  biz_status     NUMBER(1),
  process_type   VARCHAR2(8),
  push_type      VARCHAR2(8),
  push_config_id VARCHAR2(100),
  reply_msg      VARCHAR2(200),
  mo_count       NUMBER(12),
  match_type     NUMBER(1),
  case_sensitive NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.MO_BIZ
  add constraint PK_MO_BIZ primary key (MO_BIZ_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MO_BIZ_CONFIG
prompt ============================
prompt
create table mc.MO_BIZ_CONFIG
(
  id           VARCHAR2(100) not null,
  config_key   VARCHAR2(100),
  config_value VARCHAR2(100),
  priority     NUMBER(2),
  remark       VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.MO_BIZ_CONFIG
  add constraint PK_MO_BIZ_CONFIG primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MO_BIZ_DBPUSH
prompt ============================
prompt
create table mc.MO_BIZ_DBPUSH
(
  push_id       VARCHAR2(100) not null,
  push_name     VARCHAR2(100),
  status        NUMBER(1),
  db_type       VARCHAR2(100),
  driver        VARCHAR2(200),
  url           VARCHAR2(200),
  user_name     VARCHAR2(100),
  password      VARCHAR2(100),
  insert_type   NUMBER(1),
  table_name    VARCHAR2(100),
  mo_id_field   VARCHAR2(100),
  sp_field      VARCHAR2(100),
  mobile_field  VARCHAR2(100),
  msg_field     VARCHAR2(200),
  ext_field     VARCHAR2(100),
  insert_sql    VARCHAR2(100),
  max           VARCHAR2(100),
  min           VARCHAR2(100),
  init          VARCHAR2(100),
  wait_time     VARCHAR2(100),
  has_ext_field NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.MO_BIZ_DBPUSH
  add constraint PK_MO_BIZ_DBPUSH primary key (PUSH_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MO_BIZ_HTTPPUSH
prompt ==============================
prompt
create table mc.MO_BIZ_HTTPPUSH
(
  push_id          VARCHAR2(100) not null,
  push_name        VARCHAR2(120),
  is_batch         NUMBER(1),
  http_uri         VARCHAR2(500),
  pre_mobile       VARCHAR2(100),
  pre_m_o_megs     VARCHAR2(100),
  pre_receive_time VARCHAR2(100),
  pre_sp_no        VARCHAR2(100),
  pre_ext          VARCHAR2(100),
  status           NUMBER(1),
  check_frequency  VARCHAR2(100),
  create_time      TIMESTAMP(6),
  modify_time      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MO_BIZ_HTTPPUSH
  add constraint PK_MO_BIZ_HTTPPUSH primary key (PUSH_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MO_BIZ_TASK
prompt ==========================
prompt
create table mc.MO_BIZ_TASK
(
  mo_biz_task_id VARCHAR2(100) not null,
  mobile         VARCHAR2(100),
  mobile_to      VARCHAR2(100),
  msg            VARCHAR2(200),
  cmd            VARCHAR2(100),
  ext            VARCHAR2(100),
  push_status    NUMBER(1),
  resend_times   NUMBER(1),
  error_msg      VARCHAR2(200),
  sys_time       TIMESTAMP(6),
  send_time      TIMESTAMP(6),
  done_time      TIMESTAMP(6),
  process_type   VARCHAR2(8),
  push_type      VARCHAR2(8),
  push_config_id VARCHAR2(100),
  reply_msg      VARCHAR2(1000),
  mo_biz_id      VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MO_BIZ_TASK
  add constraint PK_MO_BIZ_TASK primary key (MO_BIZ_TASK_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MO_BIZ_WSPUSH
prompt ============================
prompt
create table mc.MO_BIZ_WSPUSH
(
  push_id        VARCHAR2(100) not null,
  push_name      VARCHAR2(128),
  is_batch       NUMBER(1),
  api_f_q_name   VARCHAR2(100),
  api_class_name VARCHAR2(500),
  status         NUMBER(1),
  create_time    TIMESTAMP(6),
  modify_time    TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MO_BIZ_WSPUSH
  add constraint PK_MO_BIZ_WSPUSH primary key (PUSH_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MO_LAST_EXPORT_TIME
prompt ==================================
prompt
create table mc.MO_LAST_EXPORT_TIME
(
  id               VARCHAR2(60) not null,
  org_id           VARCHAR2(60) not null,
  user_id          VARCHAR2(60) not null,
  last_export_time DATE,
  status           NUMBER,
  create_time      DATE,
  description      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.MO_LAST_EXPORT_TIME
  is '�������ж��ŵĵ���ʱ��ļ�¼��';
comment on column mc.MO_LAST_EXPORT_TIME.id
  is '����id';
comment on column mc.MO_LAST_EXPORT_TIME.org_id
  is '����id';
comment on column mc.MO_LAST_EXPORT_TIME.user_id
  is '�û�id';
comment on column mc.MO_LAST_EXPORT_TIME.last_export_time
  is '�ϴε���ʱ��';
comment on column mc.MO_LAST_EXPORT_TIME.status
  is '�Ƿ�ʹ��״̬ 0 ����  1 ʹ��';
comment on column mc.MO_LAST_EXPORT_TIME.create_time
  is '������������';
comment on column mc.MO_LAST_EXPORT_TIME.description
  is '������Ϣ';
alter table mc.MO_LAST_EXPORT_TIME
  add constraint PK_MO_LAST_EXPORT_TIME primary key (ID)
  disable;

prompt
prompt Creating table MO_LOGGER
prompt ========================
prompt
create table mc.MO_LOGGER
(
  id          VARCHAR2(100) not null,
  log_type    NUMBER(1),
  sys_time    TIMESTAMP(6),
  log_source  VARCHAR2(100),
  log_message VARCHAR2(1000)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MO_LOGGER
  add constraint PK_MO_LOGGER primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table NOTICE
prompt =====================
prompt
create table mc.NOTICE
(
  id             VARCHAR2(100) not null,
  content        VARCHAR2(4000),
  upload_date    DATE,
  operator_id    VARCHAR2(100),
  title          VARCHAR2(200),
  viable_date    DATE,
  send_user_type NUMBER(3),
  is_pastdue     NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.NOTICE
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table NOTICE_USER
prompt ==========================
prompt
create table mc.NOTICE_USER
(
  id          VARCHAR2(100) not null,
  user_id     VARCHAR2(200) not null,
  notice_id   VARCHAR2(100) not null,
  select_date DATE,
  is_read     NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.NOTICE_USER
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.NOTICE_USER
  add constraint FK596518D2871E1EFE foreign key (NOTICE_ID)
  references mc.NOTICE (ID);
alter table mc.NOTICE_USER
  add constraint FK596518D2D5594142 foreign key (USER_ID)
  references mc.USER_INFO (USER_ID);

prompt
prompt Creating table ORDER_INFO
prompt =========================
prompt
create table mc.ORDER_INFO
(
  id            VARCHAR2(50) not null,
  orderid       VARCHAR2(30) not null,
  subject       VARCHAR2(50),
  price         NUMBER(10,3),
  total_fee     NUMBER not null,
  quantity      NUMBER,
  gift_quantity NUMBER,
  orgid         VARCHAR2(100) not null,
  creater       VARCHAR2(50),
  type          CHAR(2) not null,
  infotype      CHAR(2),
  trade_state   CHAR(2),
  createtime    DATE,
  tradetime     DATE,
  endtime       DATE,
  state         CHAR(2),
  remark        VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.ORDER_INFO
  is '����֧��������';
comment on column mc.ORDER_INFO.id
  is 'id';
comment on column mc.ORDER_INFO.orderid
  is '������� ϵͳΨһ';
comment on column mc.ORDER_INFO.subject
  is '��Ʒ����';
comment on column mc.ORDER_INFO.price
  is '�۸񣨽���ֵ�޸��';
comment on column mc.ORDER_INFO.total_fee
  is '��ֵ���';
comment on column mc.ORDER_INFO.quantity
  is '��ֵ������������ֵ�޸��';
comment on column mc.ORDER_INFO.gift_quantity
  is '��������������ֵ�޸��';
comment on column mc.ORDER_INFO.orgid
  is '��ֵ����id';
comment on column mc.ORDER_INFO.creater
  is '��ֵ��';
comment on column mc.ORDER_INFO.type
  is '����ֵ / ����ֵ �� 0/1';
comment on column mc.ORDER_INFO.infotype
  is '���� / ���� �� 0/1  ������ֵ�޸��';
comment on column mc.ORDER_INFO.trade_state
  is '����״̬ 0�������1����ֵ�У�2����ֵ�ɹ���3����ֵʧ��;4:���׹ر�';
comment on column mc.ORDER_INFO.createtime
  is '��������ʱ��';
comment on column mc.ORDER_INFO.tradetime
  is '���׶���ʱ��';
comment on column mc.ORDER_INFO.endtime
  is '���׽���ʱ��';
comment on column mc.ORDER_INFO.state
  is '����״̬   ��Ĭ��0����ʾ��1�����׳ɹ���ҳ��ɾ������(����)��';
comment on column mc.ORDER_INFO.remark
  is '��ע';
alter table mc.ORDER_INFO
  add constraint ORDER_INFO_PK primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORGANIZATION
prompt ===========================
prompt
create table mc.ORGANIZATION
(
  user_id             VARCHAR2(200) not null,
  user_name           VARCHAR2(200),
  user_mome           VARCHAR2(200),
  user_balance        NUMBER(20,3) default 0,
  create_time         DATE,
  user_stat           NUMBER(1),
  extend_number       VARCHAR2(8),
  eng_signature       VARCHAR2(20),
  chn_signature       VARCHAR2(60),
  user_quota          NUMBER(22) default 0,
  pay_type            NUMBER(1),
  pay_mode            NUMBER(1),
  fee_mode            NUMBER(1),
  channel_type        NUMBER(1),
  mobile_type         NUMBER(1),
  super_org_no        VARCHAR2(200),
  parentid            VARCHAR2(200),
  organ_type          VARCHAR2(20),
  mo_type             NUMBER(1) default 0,
  recharge_explain    VARCHAR2(200),
  mms_quota           NUMBER(22) default 0,
  customer_manager_id VARCHAR2(200),
  deduct_mode         NUMBER(1) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.ORGANIZATION
  is '������Ϣ��';
comment on column mc.ORGANIZATION.user_id
  is '�������';
comment on column mc.ORGANIZATION.user_name
  is '��������';
comment on column mc.ORGANIZATION.user_mome
  is 'ע��';
comment on column mc.ORGANIZATION.user_balance
  is '���÷���';
comment on column mc.ORGANIZATION.create_time
  is '����ʱ��';
comment on column mc.ORGANIZATION.user_stat
  is '״̬, 0:��Ч, 1:��Ч';
comment on column mc.ORGANIZATION.extend_number
  is '��չ��';
comment on column mc.ORGANIZATION.eng_signature
  is 'Ӣ��ǩ��';
comment on column mc.ORGANIZATION.chn_signature
  is '����ǩ��';
comment on column mc.ORGANIZATION.user_quota
  is '�������';
comment on column mc.ORGANIZATION.pay_type
  is '��ֵ����, 0:Ԥ����, 1:�󸶷�';
comment on column mc.ORGANIZATION.pay_mode
  is '�Ʒѵ�λ, 0:����, 1:����';
comment on column mc.ORGANIZATION.fee_mode
  is '�۷ѷ�ʽ, 0:�Ը���, 1:�鸶��';
comment on column mc.ORGANIZATION.channel_type
  is '�Ƿ�����ͨ��, 0:������, 1:����';
comment on column mc.ORGANIZATION.mobile_type
  is '�Ƿ����ֺŶ�, 0:������, 1:����';
comment on column mc.ORGANIZATION.super_org_no
  is '�������࣬������ϵ����״��ʾ��6000��Ӫҵ����7000��������8000��������9000���ӹ�˾';
comment on column mc.ORGANIZATION.organ_type
  is '0:���� 1:ֱ��';
comment on column mc.ORGANIZATION.mo_type
  is '0:���������� 1:���е����� 2:���е��û�';
comment on column mc.ORGANIZATION.recharge_explain
  is '��ֵ˵��';
comment on column mc.ORGANIZATION.mms_quota
  is '�������';
comment on column mc.ORGANIZATION.deduct_mode
  is '�۷ѷ�ʽ 0:�ύ�۷� 1:�ɹ��۷�';
alter table mc.ORGANIZATION
  add constraint PK_ORGANIZATION primary key (USER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORG_CONFIG
prompt =========================
prompt
create table mc.ORG_CONFIG
(
  id              VARCHAR2(20) not null,
  organization_id VARCHAR2(50) not null,
  logo            VARCHAR2(200),
  domain_name     VARCHAR2(200),
  copyright       VARCHAR2(200),
  company_tel     VARCHAR2(50),
  company_cn      VARCHAR2(100),
  company_en      VARCHAR2(100),
  company_email   VARCHAR2(200),
  service_qq      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ORG_CONFIG
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORG_MMS_SEND_CONFIG
prompt ==================================
prompt
create table mc.ORG_MMS_SEND_CONFIG
(
  config_id     VARCHAR2(200) not null,
  org_id        VARCHAR2(500),
  org_name      VARCHAR2(500),
  priority_code NUMBER(10),
  create_time   TIMESTAMP(6),
  start_time    TIMESTAMP(6),
  end_time      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.ORG_MMS_SEND_CONFIG
  is '�������ŷ��͵����';
alter table mc.ORG_MMS_SEND_CONFIG
  add constraint PK_ORG_MMS_SEND_CONFIG primary key (CONFIG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORG_REMAIN_BALANCE
prompt =================================
prompt
create table mc.ORG_REMAIN_BALANCE
(
  row_id                 VARCHAR2(200) not null,
  user_id                VARCHAR2(200) not null,
  status                 NUMBER(1),
  sms_quota              NUMBER(22),
  unit_price             NUMBER(5,3),
  gw_type                NUMBER(1),
  update_unitprice_date  DATE,
  update_user            VARCHAR2(200),
  remark                 VARCHAR2(200),
  last_update_quota_date DATE,
  user_type              NUMBER(1),
  mms_quota              NUMBER(22)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.ORG_REMAIN_BALANCE
  is '����������';
comment on column mc.ORG_REMAIN_BALANCE.row_id
  is '����';
comment on column mc.ORG_REMAIN_BALANCE.user_id
  is '����ID';
comment on column mc.ORG_REMAIN_BALANCE.status
  is '״̬, 1:��Ч, 0:��Ч';
comment on column mc.ORG_REMAIN_BALANCE.sms_quota
  is '���ö�������';
comment on column mc.ORG_REMAIN_BALANCE.unit_price
  is '����';
comment on column mc.ORG_REMAIN_BALANCE.gw_type
  is '�Ŷ����͡�0-ȫ��·��1-�ƶ��ŶΣ�2-��ͨ�ŶΣ�3-С��ͨ�Ŷ�';
comment on column mc.ORG_REMAIN_BALANCE.update_unitprice_date
  is '�޸�Э���ʱ��';
comment on column mc.ORG_REMAIN_BALANCE.update_user
  is '�޸���';
comment on column mc.ORG_REMAIN_BALANCE.remark
  is '��ע';
comment on column mc.ORG_REMAIN_BALANCE.last_update_quota_date
  is '���һ���޸����ʱ��';
comment on column mc.ORG_REMAIN_BALANCE.user_type
  is '�û�����: 0�û�  1����';
comment on column mc.ORG_REMAIN_BALANCE.mms_quota
  is '���ò�������';
alter table mc.ORG_REMAIN_BALANCE
  add constraint PK_ROW_ID primary key (ROW_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PAYMENT_RECORD
prompt =============================
prompt
create table mc.PAYMENT_RECORD
(
  payment_id       VARCHAR2(200) not null,
  user_id          VARCHAR2(200) not null,
  payment_time     DATE,
  payment_money    NUMBER(20,3) default 0,
  payment_quota    NUMBER(22) default 0,
  operator_id      VARCHAR2(200),
  payment_type     NUMBER(1),
  is_online        NUMBER(1),
  user_type        NUMBER(1),
  recharge_explain VARCHAR2(200),
  quota_type       NUMBER(1) default 1,
  is_success       NUMBER(1) default 1
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column mc.PAYMENT_RECORD.payment_id
  is '����';
comment on column mc.PAYMENT_RECORD.user_id
  is '��ֵ���û����߻���';
comment on column mc.PAYMENT_RECORD.payment_time
  is '��ֵʱ��';
comment on column mc.PAYMENT_RECORD.payment_money
  is '��ֵ�Ľ��';
comment on column mc.PAYMENT_RECORD.payment_quota
  is '��ֵ�����';
comment on column mc.PAYMENT_RECORD.operator_id
  is '��ֵ������';
comment on column mc.PAYMENT_RECORD.payment_type
  is '��ֵ���� 1:���  0:��� 2:������ 3:���� 4:������ 5:����';
comment on column mc.PAYMENT_RECORD.is_online
  is '�Ƿ������߳�ֵ 1:�� 0:��';
comment on column mc.PAYMENT_RECORD.user_type
  is '����¼���û����� 1:���� 0:�û�';
comment on column mc.PAYMENT_RECORD.recharge_explain
  is '��¼��ֵ˵��';
comment on column mc.PAYMENT_RECORD.quota_type
  is '������� 1:���� 0:����';
comment on column mc.PAYMENT_RECORD.is_success
  is '�Ƿ��ֵ�ɹ� 1:�ɹ� 0:ʧ��';
alter table mc.PAYMENT_RECORD
  add constraint PK_PAYMENTID primary key (PAYMENT_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PB_LIST_OF_VALUE
prompt ===============================
prompt
create table mc.PB_LIST_OF_VALUE
(
  row_id        VARCHAR2(40) not null,
  status        VARCHAR2(40),
  stand_code    VARCHAR2(40),
  type_id       VARCHAR2(40),
  type_name     VARCHAR2(40),
  display_value VARCHAR2(40),
  value_desc    VARCHAR2(40)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column mc.PB_LIST_OF_VALUE.row_id
  is '����';
comment on column mc.PB_LIST_OF_VALUE.status
  is '״̬:0��Ч,1,��Ч';
comment on column mc.PB_LIST_OF_VALUE.stand_code
  is '�ֶα���';
comment on column mc.PB_LIST_OF_VALUE.type_id
  is '����';
comment on column mc.PB_LIST_OF_VALUE.type_name
  is '������';
comment on column mc.PB_LIST_OF_VALUE.display_value
  is '��ʾ��';
comment on column mc.PB_LIST_OF_VALUE.value_desc
  is 'ֵע��';
alter table mc.PB_LIST_OF_VALUE
  add constraint PK_PB_LIST_OF_VALUE primary key (ROW_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PERMIT_WORD
prompt ==========================
prompt
create table mc.PERMIT_WORD
(
  id                 NUMBER(18) not null,
  permit_word        VARCHAR2(50) not null,
  description        VARCHAR2(200),
  createtime         DATE default SYSDATE,
  modifytime         DATE,
  create_user_id     VARCHAR2(200),
  permit_word_status CHAR(1) default '1'
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PERMIT_WORD
  is '��ɴʱ�';
comment on column mc.PERMIT_WORD.id
  is '����';
comment on column mc.PERMIT_WORD.permit_word
  is '��ɴ�';
comment on column mc.PERMIT_WORD.description
  is '��ע';
comment on column mc.PERMIT_WORD.createtime
  is '����ʱ��';
comment on column mc.PERMIT_WORD.modifytime
  is '�޸�ʱ��';
comment on column mc.PERMIT_WORD.create_user_id
  is '������';
comment on column mc.PERMIT_WORD.permit_word_status
  is '״̬, 0:ͣ��, 1:����';
alter table mc.PERMIT_WORD
  add constraint PK_PERMIT_WORD primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index mc.UDX_PERMIT_WORD on mc.PERMIT_WORD (PERMIT_WORD)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHRASE_GROUP
prompt ===========================
prompt
create table mc.PHRASE_GROUP
(
  group_id     VARCHAR2(50) not null,
  group_name   VARCHAR2(200),
  group_remark VARCHAR2(200),
  user_id      VARCHAR2(200),
  create_time  DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.PHRASE_GROUP
  is '���ö�����';
comment on column mc.PHRASE_GROUP.group_id
  is '���ö�������';
comment on column mc.PHRASE_GROUP.group_name
  is '���ö���������';
comment on column mc.PHRASE_GROUP.group_remark
  is '��ע';
comment on column mc.PHRASE_GROUP.user_id
  is '�û����';
comment on column mc.PHRASE_GROUP.create_time
  is '����ʱ��';
alter table mc.PHRASE_GROUP
  add constraint PK_PHRASE_GROUP primary key (GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table PHRASE_INFO
prompt ==========================
prompt
create table mc.PHRASE_INFO
(
  phrase_id      VARCHAR2(50) not null,
  phrase_name    VARCHAR2(1000),
  phrase_content VARCHAR2(1000),
  phrase_remark  VARCHAR2(1000),
  group_id       VARCHAR2(50),
  create_time    DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PHRASE_INFO
  is '���ö���';
comment on column mc.PHRASE_INFO.phrase_id
  is '������';
comment on column mc.PHRASE_INFO.phrase_name
  is '��������';
comment on column mc.PHRASE_INFO.phrase_content
  is '��������';
comment on column mc.PHRASE_INFO.phrase_remark
  is '��ע';
comment on column mc.PHRASE_INFO.group_id
  is '���ö�������';
comment on column mc.PHRASE_INFO.create_time
  is '����ʱ��';
alter table mc.PHRASE_INFO
  add constraint PK_PHRASE_INFO primary key (PHRASE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PLAT_LOG
prompt =======================
prompt
create table mc.PLAT_LOG
(
  plat_log_id            VARCHAR2(200) not null,
  user_id                VARCHAR2(200),
  user_name              VARCHAR2(200),
  user_organization      VARCHAR2(200),
  user_organization_name VARCHAR2(200),
  log_type               VARCHAR2(20),
  description            VARCHAR2(500),
  log_time               DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PLAT_LOG
  is '����ƽ̨��־��';
comment on column mc.PLAT_LOG.plat_log_id
  is '��־���';
comment on column mc.PLAT_LOG.user_id
  is '�����߱��';
comment on column mc.PLAT_LOG.user_name
  is '�������û���';
comment on column mc.PLAT_LOG.user_organization
  is '�����������������';
comment on column mc.PLAT_LOG.user_organization_name
  is '������������������';
comment on column mc.PLAT_LOG.log_type
  is '��־����, 1:����\�ǳ�, 4:ϵͳ����\�ر�, 8���ճ���Ϣ, 9��������Ϣ';
comment on column mc.PLAT_LOG.description
  is '��ϸ��Ϣ';
comment on column mc.PLAT_LOG.log_time
  is '��־ʱ��';
alter table mc.PLAT_LOG
  add constraint PK_PLAT_LOG primary key (PLAT_LOG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRICING_PACKAGE_INFO
prompt ===================================
prompt
create table mc.PRICING_PACKAGE_INFO
(
  id          VARCHAR2(200) not null,
  packagename VARCHAR2(100) not null,
  type        VARCHAR2(2) not null,
  rule        VARCHAR2(2) not null,
  infonum1    NUMBER(10),
  infonum2    NUMBER(10),
  price       NUMBER(10,3),
  coupon      VARCHAR2(2),
  infonum3    NUMBER(10),
  infonum4    NUMBER(10),
  createdate  DATE,
  creater     VARCHAR2(100),
  remark      VARCHAR2(200),
  state       VARCHAR2(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PRICING_PACKAGE_INFO
  is '�ײͱ�';
comment on column mc.PRICING_PACKAGE_INFO.id
  is '����id';
comment on column mc.PRICING_PACKAGE_INFO.packagename
  is '�ײ�����';
comment on column mc.PRICING_PACKAGE_INFO.type
  is '�ײ����ͣ�0������/1�����ţ�';
comment on column mc.PRICING_PACKAGE_INFO.rule
  is '�ײ͹����־  0������һ�£�1�����������������䣻2������������';
comment on column mc.PRICING_PACKAGE_INFO.infonum1
  is '�ײ�����1';
comment on column mc.PRICING_PACKAGE_INFO.infonum2
  is '�ײ�����2';
comment on column mc.PRICING_PACKAGE_INFO.price
  is '����';
comment on column mc.PRICING_PACKAGE_INFO.coupon
  is '�Ƿ��Ż�(0:�ǣ�1:��)';
comment on column mc.PRICING_PACKAGE_INFO.infonum3
  is '�Ż�����1';
comment on column mc.PRICING_PACKAGE_INFO.infonum4
  is '�Ż�����2';
comment on column mc.PRICING_PACKAGE_INFO.createdate
  is '��������';
comment on column mc.PRICING_PACKAGE_INFO.creater
  is '������';
comment on column mc.PRICING_PACKAGE_INFO.remark
  is '��ע';
comment on column mc.PRICING_PACKAGE_INFO.state
  is '״̬ 0������;1:ͣ��';
alter table mc.PRICING_PACKAGE_INFO
  add constraint PRICING_PACKAGE_INFO_PK primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCT
prompt ======================
prompt
create table mc.PRODUCT
(
  productid    VARCHAR2(50) not null,
  productname  VARCHAR2(50),
  catalogid    VARCHAR2(50) default 10000,
  description  VARCHAR2(500),
  reservedint  NUMBER(1),
  reservedchar VARCHAR2(2000),
  stautus      NUMBER(1) default 0,
  createtime   DATE default sysdate,
  modifytime   DATE default sysdate,
  user_id      VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.PRODUCT
  is '��Ʒ��Ϣ';
comment on column mc.PRODUCT.productid
  is '���룬�����ƷΨһ��ʶ���ñ���ɹ���Ա�ֹ���д�����ű��ΪD001�������Ų�ƷΪC001�����ֶ�Ϊ����';
comment on column mc.PRODUCT.productname
  is '���룬�����Ʒ��Ҫ����';
comment on column mc.PRODUCT.catalogid
  is '����Ŀ¼��ID';
comment on column mc.PRODUCT.description
  is '�����Ʒ���Եȵ�˵������';
comment on column mc.PRODUCT.reservedint
  is '����';
comment on column mc.PRODUCT.reservedchar
  is 'JSON��ʽ����¼���ܷ�����Ʒ���ݵĻ���ID��ʽ';
comment on column mc.PRODUCT.stautus
  is '0:���ã�1:���᣻�ݱ�������';
comment on column mc.PRODUCT.createtime
  is '��Ʒ����ʱ��';
comment on column mc.PRODUCT.modifytime
  is '��Ʒ�޸�ʱ��';
comment on column mc.PRODUCT.user_id
  is '�û����';
alter table mc.PRODUCT
  add constraint PK_PRODUCT primary key (PRODUCTID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table PRODUCT_ORGANIZATION_ITEMS
prompt =========================================
prompt
create table mc.PRODUCT_ORGANIZATION_ITEMS
(
  id             VARCHAR2(50) not null,
  productid      VARCHAR2(50),
  organizationid VARCHAR2(200),
  status         NUMBER(1) default 0,
  itemsjson      VARCHAR2(2000),
  createtime     DATE default sysdate,
  modifytime     DATE default sysdate,
  reservedint    NUMBER(1),
  reservedchar   VARCHAR2(200),
  isextends      NUMBER(1) default 0,
  groupid        VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.PRODUCT_ORGANIZATION_ITEMS
  is 'Ϊ�������ò�Ʒ��������';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.id
  is 'ID';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.productid
  is '��Ʒ���';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.organizationid
  is '�������';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.status
  is '��¼״̬';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.itemsjson
  is '��ǰ������Ե�ǰ��Ʒ����������Ϣ';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.createtime
  is '����ʱ��';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.modifytime
  is '�޸�ʱ��';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.reservedint
  is 'INT�����ֶ�,��¼�˵�ǰ���õ����ȼ�1-8����Խ�����ȼ�Խ��';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.reservedchar
  is 'CHAR�����ֶ�';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.isextends
  is '��Ӧ���Ƿ���Լ̳����ڻ�����Ӧ��Ʒ��������Ϣ��0:�����棻1���̳�';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.groupid
  is '��ID';
alter table mc.PRODUCT_ORGANIZATION_ITEMS
  add constraint PK_PRODUCT_ORGANIZATION_ITEMS primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table PROHIBITEDWORD
prompt =============================
prompt
create table mc.PROHIBITEDWORD
(
  id             VARCHAR2(50) not null,
  prohibitedword VARCHAR2(200),
  description    VARCHAR2(200),
  createtime     DATE,
  modifytime     DATE,
  create_user    VARCHAR2(200),
  class_id       VARCHAR2(200),
  status         NUMBER(4)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.PROHIBITEDWORD
  is 'Υ���ʱ�';
comment on column mc.PROHIBITEDWORD.id
  is '����';
comment on column mc.PROHIBITEDWORD.prohibitedword
  is 'Υ����';
comment on column mc.PROHIBITEDWORD.description
  is '��ע';
comment on column mc.PROHIBITEDWORD.createtime
  is '����ʱ��';
comment on column mc.PROHIBITEDWORD.modifytime
  is '�޸�ʱ��';
comment on column mc.PROHIBITEDWORD.create_user
  is '������';
comment on column mc.PROHIBITEDWORD.class_id
  is 'Υ���ʷ���Id';
comment on column mc.PROHIBITEDWORD.status
  is 'Υ����״̬, 0:ͣ��, 1:����';
alter table mc.PROHIBITEDWORD
  add constraint PK_PROHIBITEDWORD primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table PROHIBITEDWORD_CLASS
prompt ===================================
prompt
create table mc.PROHIBITEDWORD_CLASS
(
  id          VARCHAR2(50) not null,
  name        VARCHAR2(200),
  description VARCHAR2(200),
  createtime  DATE,
  create_user VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PROHIBITEDWORD_CLASS
  is 'Υ���ʷ����';
comment on column mc.PROHIBITEDWORD_CLASS.id
  is '����';
comment on column mc.PROHIBITEDWORD_CLASS.name
  is '��������';
comment on column mc.PROHIBITEDWORD_CLASS.description
  is '��ע';
comment on column mc.PROHIBITEDWORD_CLASS.createtime
  is '����ʱ��';
comment on column mc.PROHIBITEDWORD_CLASS.create_user
  is '������';
alter table mc.PROHIBITEDWORD_CLASS
  add constraint PK_PROHIBITEDWORD_CLASS primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PROHIBITED_CHANNEL_TYPE_INFO
prompt ===========================================
prompt
create table mc.PROHIBITED_CHANNEL_TYPE_INFO
(
  channel_type_id   VARCHAR2(50) not null,
  channel_type_name VARCHAR2(50),
  description       VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.PROHIBITED_CHANNEL_TYPE_INFO
  add primary key (CHANNEL_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.PROHIBITED_CHANNEL_TYPE_INFO
  add unique (CHANNEL_TYPE_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table PROHIBITED_WORD
prompt ==============================
prompt
create table mc.PROHIBITED_WORD
(
  id                VARCHAR2(50) not null,
  prohibited_word   VARCHAR2(200),
  description       VARCHAR2(200),
  status            NUMBER(10),
  create_time       DATE,
  modify_time       DATE,
  reserved_int      NUMBER(10) default -1,
  reserved_char     VARCHAR2(4),
  channel_type_code VARCHAR2(50),
  channel_id        NUMBER(10) default -1,
  create_user       VARCHAR2(50),
  channel_type_id   VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.PROHIBITED_WORD
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.PROHIBITED_WORD
  add unique (CHANNEL_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.PROHIBITED_WORD
  add constraint FKBB08CBEB1147B70E foreign key (CHANNEL_TYPE_ID)
  references mc.PROHIBITED_CHANNEL_TYPE_INFO (CHANNEL_TYPE_ID);

prompt
prompt Creating table PROHIBIT_WORD
prompt ============================
prompt
create table mc.PROHIBIT_WORD
(
  id                     VARCHAR2(50) not null,
  prohibit_word          VARCHAR2(200) not null,
  description            VARCHAR2(200),
  createtime             DATE default SYSDATE,
  modifytime             DATE,
  create_user_id         VARCHAR2(200),
  prohibited_word_status CHAR(1) default '1'
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PROHIBIT_WORD
  is 'Υ���ʱ�';
comment on column mc.PROHIBIT_WORD.id
  is '����';
comment on column mc.PROHIBIT_WORD.prohibit_word
  is 'Υ����';
comment on column mc.PROHIBIT_WORD.description
  is '��ע';
comment on column mc.PROHIBIT_WORD.createtime
  is '����ʱ��';
comment on column mc.PROHIBIT_WORD.modifytime
  is '�޸�ʱ��';
comment on column mc.PROHIBIT_WORD.create_user_id
  is '������ID';
comment on column mc.PROHIBIT_WORD.prohibited_word_status
  is 'Υ����״̬, 0:ͣ��, 1:����';
alter table mc.PROHIBIT_WORD
  add constraint PK_PROHIBIT_WORD primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index mc.IDX_PROHIBITWORD on mc.PROHIBIT_WORD (PROHIBIT_WORD)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_JOB_DETAILS
prompt ===============================
prompt
create table mc.QRTZ_JOB_DETAILS
(
  job_name          VARCHAR2(80) not null,
  job_group         VARCHAR2(80) not null,
  description       VARCHAR2(120),
  job_class_name    VARCHAR2(128) not null,
  is_durable        VARCHAR2(1) not null,
  is_volatile       VARCHAR2(1) not null,
  is_stateful       VARCHAR2(1) not null,
  requests_recovery VARCHAR2(1) not null,
  job_data          BLOB
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_JOB_DETAILS
  add primary key (JOB_NAME, JOB_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_J_REQ_RECOVERY on mc.QRTZ_JOB_DETAILS (REQUESTS_RECOVERY)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_TRIGGERS
prompt ============================
prompt
create table mc.QRTZ_TRIGGERS
(
  trigger_name   VARCHAR2(80) not null,
  trigger_group  VARCHAR2(80) not null,
  job_name       VARCHAR2(80) not null,
  job_group      VARCHAR2(80) not null,
  is_volatile    VARCHAR2(1) not null,
  description    VARCHAR2(120),
  next_fire_time NUMBER(13),
  prev_fire_time NUMBER(13),
  priority       NUMBER(13),
  trigger_state  VARCHAR2(16) not null,
  trigger_type   VARCHAR2(8) not null,
  start_time     NUMBER(13) not null,
  end_time       NUMBER(13),
  calendar_name  VARCHAR2(80),
  misfire_instr  NUMBER(2),
  job_data       BLOB
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_TRIGGERS
  add foreign key (JOB_NAME, JOB_GROUP)
  references mc.QRTZ_JOB_DETAILS (JOB_NAME, JOB_GROUP);
create index mc.IDX_QRTZ_T_NEXT_FIRE_TIME on mc.QRTZ_TRIGGERS (NEXT_FIRE_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_T_NFT_ST on mc.QRTZ_TRIGGERS (NEXT_FIRE_TIME, TRIGGER_STATE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_T_STATE on mc.QRTZ_TRIGGERS (TRIGGER_STATE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_T_VOLATILE on mc.QRTZ_TRIGGERS (IS_VOLATILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_BLOB_TRIGGERS
prompt =================================
prompt
create table mc.QRTZ_BLOB_TRIGGERS
(
  trigger_name  VARCHAR2(80) not null,
  trigger_group VARCHAR2(80) not null,
  blob_data     BLOB
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_BLOB_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.QRTZ_BLOB_TRIGGERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references mc.QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_CALENDARS
prompt =============================
prompt
create table mc.QRTZ_CALENDARS
(
  calendar_name VARCHAR2(80) not null,
  calendar      BLOB not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_CALENDARS
  add primary key (CALENDAR_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table QRTZ_CRON_TRIGGERS
prompt =================================
prompt
create table mc.QRTZ_CRON_TRIGGERS
(
  trigger_name    VARCHAR2(80) not null,
  trigger_group   VARCHAR2(80) not null,
  cron_expression VARCHAR2(80) not null,
  time_zone_id    VARCHAR2(80)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_CRON_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_CRON_TRIGGERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references mc.QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_FIRED_TRIGGERS
prompt ==================================
prompt
create table mc.QRTZ_FIRED_TRIGGERS
(
  entry_id          VARCHAR2(95) not null,
  trigger_name      VARCHAR2(80) not null,
  trigger_group     VARCHAR2(80) not null,
  is_volatile       VARCHAR2(1) not null,
  instance_name     VARCHAR2(80) not null,
  fired_time        NUMBER(13) not null,
  priority          NUMBER(13) not null,
  state             VARCHAR2(16) not null,
  job_name          VARCHAR2(80),
  job_group         VARCHAR2(80),
  is_stateful       VARCHAR2(1),
  requests_recovery VARCHAR2(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_FIRED_TRIGGERS
  add primary key (ENTRY_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_JOB_GROUP on mc.QRTZ_FIRED_TRIGGERS (JOB_GROUP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_JOB_NAME on mc.QRTZ_FIRED_TRIGGERS (JOB_NAME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_JOB_REQ_RECOVERY on mc.QRTZ_FIRED_TRIGGERS (REQUESTS_RECOVERY)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_JOB_STATEFUL on mc.QRTZ_FIRED_TRIGGERS (IS_STATEFUL)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_TRIG_GROUP on mc.QRTZ_FIRED_TRIGGERS (TRIGGER_GROUP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_TRIG_INST_NAME on mc.QRTZ_FIRED_TRIGGERS (INSTANCE_NAME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_TRIG_NAME on mc.QRTZ_FIRED_TRIGGERS (TRIGGER_NAME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_TRIG_NM_GP on mc.QRTZ_FIRED_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_TRIG_VOLATILE on mc.QRTZ_FIRED_TRIGGERS (IS_VOLATILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_JOB_LISTENERS
prompt =================================
prompt
create table mc.QRTZ_JOB_LISTENERS
(
  job_name     VARCHAR2(80) not null,
  job_group    VARCHAR2(80) not null,
  job_listener VARCHAR2(80) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_JOB_LISTENERS
  add primary key (JOB_NAME, JOB_GROUP, JOB_LISTENER)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.QRTZ_JOB_LISTENERS
  add foreign key (JOB_NAME, JOB_GROUP)
  references mc.QRTZ_JOB_DETAILS (JOB_NAME, JOB_GROUP);

prompt
prompt Creating table QRTZ_LOCKS
prompt =========================
prompt
create table mc.QRTZ_LOCKS
(
  lock_name VARCHAR2(40) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_LOCKS
  add primary key (LOCK_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_PAUSED_TRIGGER_GRPS
prompt =======================================
prompt
create table mc.QRTZ_PAUSED_TRIGGER_GRPS
(
  trigger_group VARCHAR2(80) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_PAUSED_TRIGGER_GRPS
  add primary key (TRIGGER_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table QRTZ_SCHEDULER_STATE
prompt ===================================
prompt
create table mc.QRTZ_SCHEDULER_STATE
(
  instance_name     VARCHAR2(80) not null,
  last_checkin_time NUMBER(13) not null,
  checkin_interval  NUMBER(13) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_SCHEDULER_STATE
  add primary key (INSTANCE_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table QRTZ_SIMPLE_TRIGGERS
prompt ===================================
prompt
create table mc.QRTZ_SIMPLE_TRIGGERS
(
  trigger_name    VARCHAR2(80) not null,
  trigger_group   VARCHAR2(80) not null,
  repeat_count    NUMBER(7) not null,
  repeat_interval NUMBER(12) not null,
  times_triggered NUMBER(7) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_SIMPLE_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_SIMPLE_TRIGGERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references mc.QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_TRIGGER_LISTENERS
prompt =====================================
prompt
create table mc.QRTZ_TRIGGER_LISTENERS
(
  trigger_name     VARCHAR2(80) not null,
  trigger_group    VARCHAR2(80) not null,
  trigger_listener VARCHAR2(80) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_TRIGGER_LISTENERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP, TRIGGER_LISTENER)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.QRTZ_TRIGGER_LISTENERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references mc.QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table RECBIZ_DB
prompt ========================
prompt
create table mc.RECBIZ_DB
(
  db_id           VARCHAR2(50) not null,
  db_name         VARCHAR2(50),
  db_content      VARCHAR2(100),
  db_channel      VARCHAR2(200),
  db_user         VARCHAR2(4000),
  db_service      VARCHAR2(4000),
  remark          VARCHAR2(4000),
  organization_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.RECBIZ_DB
  is '�㲥���Ź���';
comment on column mc.RECBIZ_DB.db_id
  is '���';
comment on column mc.RECBIZ_DB.db_name
  is '�㲥������';
comment on column mc.RECBIZ_DB.db_content
  is '�㲥������';
comment on column mc.RECBIZ_DB.db_channel
  is '�㲥��ͨ��';
comment on column mc.RECBIZ_DB.db_user
  is '��ӵ㲥�Ļ���';
comment on column mc.RECBIZ_DB.db_service
  is '�㲥���ط���';
comment on column mc.RECBIZ_DB.remark
  is '��ע';
comment on column mc.RECBIZ_DB.organization_id
  is '����id';
alter table mc.RECBIZ_DB
  add constraint PK_RECBIZ_DB primary key (DB_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RESOURCE_INFO
prompt ============================
prompt
create table mc.RESOURCE_INFO
(
  resource_id        VARCHAR2(200) not null,
  resource_name      VARCHAR2(200),
  resource_content   VARCHAR2(500),
  resource_type_id   VARCHAR2(200),
  resource_remark    VARCHAR2(500),
  resource_parentid  VARCHAR2(200),
  resource_access    VARCHAR2(100),
  resource_image     VARCHAR2(40),
  resource_sort      VARCHAR2(50),
  is_default         VARCHAR2(10),
  resource_role_type VARCHAR2(200),
  resource_path      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.RESOURCE_INFO
  is '��Դ��';
comment on column mc.RESOURCE_INFO.resource_id
  is '��Դ���';
comment on column mc.RESOURCE_INFO.resource_name
  is '��Դ����';
comment on column mc.RESOURCE_INFO.resource_content
  is '��Դ����';
comment on column mc.RESOURCE_INFO.resource_type_id
  is '��Դ����';
comment on column mc.RESOURCE_INFO.resource_remark
  is '��Դ��ע';
comment on column mc.RESOURCE_INFO.resource_parentid
  is '����Դid';
comment on column mc.RESOURCE_INFO.resource_access
  is '��Դ��������,0:��ͨ��Դ, 1:ϵͳ��Դ';
comment on column mc.RESOURCE_INFO.resource_image
  is '��ʾͼƬ';
comment on column mc.RESOURCE_INFO.resource_sort
  is '��ʾ˳��';
comment on column mc.RESOURCE_INFO.is_default
  is '�Ƿ���Ĭ����ʾ';
comment on column mc.RESOURCE_INFO.resource_role_type
  is '��ԴȨ�����ͣ�SYSTEM:ϵͳȨ�ޣ�ORGADMIN����������Ա��COMMON����ͨȨ��';
alter table mc.RESOURCE_INFO
  add constraint PK_RESOURCE_INFO primary key (RESOURCE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_ACQUIRE_TIMESTAMP
prompt ===================================
prompt
create table mc.RT_ACQUIRE_TIMESTAMP
(
  id                VARCHAR2(200) not null,
  org_id            VARCHAR2(2000),
  user_id           VARCHAR2(2000),
  qcquire_url       VARCHAR2(2000),
  qcquire_timestamp DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.RT_ACQUIRE_TIMESTAMP
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table RT_RECEIVE
prompt =========================
prompt
create table mc.RT_RECEIVE
(
  rt_receive_id  VARCHAR2(200) not null,
  org_id         VARCHAR2(200),
  user_id        VARCHAR2(200),
  sp_no          VARCHAR2(20),
  sp_serv_no     VARCHAR2(20),
  mobile         VARCHAR2(20),
  receive_msg    VARCHAR2(200),
  receive_time   DATE,
  pushed_time    DATE,
  is_pushed      NUMBER(10),
  reserved_char1 VARCHAR2(200),
  reserved_char2 VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_RECEIVE
  add primary key (RT_RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_RECEIVE_BACKUP
prompt ================================
prompt
create table mc.RT_RECEIVE_BACKUP
(
  rt_receive_id  VARCHAR2(200) not null,
  org_id         VARCHAR2(200),
  sp_no          VARCHAR2(20),
  sp_serv_no     VARCHAR2(20),
  mobile         VARCHAR2(20),
  receive_msg    VARCHAR2(200),
  receive_time   DATE,
  pushed_time    DATE,
  is_pushed      NUMBER(10),
  reserved_char1 VARCHAR2(200),
  reserved_char2 VARCHAR2(200),
  user_id        VARCHAR2(200),
  backup_time    DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_RECEIVE_BACKUP
  add primary key (RT_RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_RECEIVE_REPORT_CONFIG
prompt =======================================
prompt
create table mc.RT_RECEIVE_REPORT_CONFIG
(
  config_id             VARCHAR2(200) not null,
  type                  NUMBER(10),
  push_max_nums         NUMBER(10),
  push_frequency        NUMBER(10),
  push_timeout          NUMBER(10),
  push_margin           NUMBER(10),
  max_no_response_times NUMBER(10),
  cpu_usered            FLOAT,
  sms_send_nums         NUMBER(10),
  status                NUMBER(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_RECEIVE_REPORT_CONFIG
  add primary key (CONFIG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_RECEIVE_REPORT_URL
prompt ====================================
prompt
create table mc.RT_RECEIVE_REPORT_URL
(
  url_id           VARCHAR2(200) not null,
  user_id          VARCHAR2(200),
  push_channel     NUMBER(10),
  format_str       NUMBER(10),
  push_url         VARCHAR2(200),
  push_url_type    NUMBER(10),
  create_time      DATE,
  status           NUMBER(10),
  is_certification NUMBER(10),
  user_name        VARCHAR2(200),
  pass_word        VARCHAR2(200),
  uanswer_times    NUMBER(10),
  next_push_time   DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_RECEIVE_REPORT_URL
  add primary key (URL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_REPORT
prompt ========================
prompt
create table mc.RT_REPORT
(
  sms_id      VARCHAR2(200) not null,
  seq_id      VARCHAR2(200),
  org_id      VARCHAR2(200),
  user_id     VARCHAR2(200),
  mobile      VARCHAR2(200),
  report_time DATE,
  pushed_time DATE,
  send_status NUMBER(10),
  error_msg   VARCHAR2(200),
  is_pushed   NUMBER(10),
  channel_id  NUMBER(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_REPORT
  add primary key (SMS_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_REPORT_BACKUP
prompt ===============================
prompt
create table mc.RT_REPORT_BACKUP
(
  sms_id      VARCHAR2(200) not null,
  seq_id      VARCHAR2(200),
  org_id      VARCHAR2(200),
  user_id     VARCHAR2(200),
  mobile      VARCHAR2(200),
  report_time DATE,
  pushed_time DATE,
  backup_time DATE,
  send_status NUMBER(10),
  error_msg   VARCHAR2(200),
  is_pushed   NUMBER(10),
  channel_id  NUMBER(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_REPORT_BACKUP
  add primary key (SMS_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RUPD$_ORGANIZATION
prompt =================================
prompt
create global temporary table mc.RUPD$_ORGANIZATION
(
  user_id         VARCHAR2(200),
  dmltype$$       VARCHAR2(1),
  snapid          INTEGER,
  change_vector$$ RAW(255)
)
on commit preserve rows;
comment on table mc.RUPD$_ORGANIZATION
  is 'temporary updatable snapshot log';

prompt
prompt Creating table RUPD$_SEND
prompt =========================
prompt
create global temporary table mc.RUPD$_SEND
(
  send_id         VARCHAR2(200),
  dmltype$$       VARCHAR2(1),
  snapid          INTEGER,
  change_vector$$ RAW(255)
)
on commit preserve rows;
comment on table mc.RUPD$_SEND
  is 'temporary updatable snapshot log';

prompt
prompt Creating table SEC_ACL
prompt ======================
prompt
create table mc.SEC_ACL
(
  resource_id           VARCHAR2(100) not null,
  resource_type         VARCHAR2(20) not null,
  role_id               VARCHAR2(20) not null,
  party_id              VARCHAR2(100) not null,
  party_type            VARCHAR2(20) not null,
  created_by            VARCHAR2(100),
  created_by_name       VARCHAR2(100),
  is_default            VARCHAR2(10),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SEC_ACL
  is '���ʿ����б������û���ĳ��Դ��ĳ��ɫ����һ��Ȩ�ޣ�';
comment on column mc.SEC_ACL.resource_id
  is '��Դ���';
comment on column mc.SEC_ACL.resource_type
  is '��Դ����,ColumnCategoryΪ��Ŀ��ColumnInfoΪ��Ŀ����';
comment on column mc.SEC_ACL.role_id
  is '��ɫ���';
comment on column mc.SEC_ACL.party_id
  is '����Ȩ��';
comment on column mc.SEC_ACL.party_type
  is '����Ȩ����';
comment on column mc.SEC_ACL.created_by
  is '������';
comment on column mc.SEC_ACL.created_by_name
  is '����������';
comment on column mc.SEC_ACL.is_default
  is '�Ƿ�ȱʡ�û�';
alter table mc.SEC_ACL
  add constraint PK_SEC_ACL primary key (RESOURCE_ID, RESOURCE_TYPE, ROLE_ID, PARTY_ID, PARTY_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SEC_ACL_TXCRTS on mc.SEC_ACL (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SEC_ACL_TXSTMP on mc.SEC_ACL (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SEC_PARTY_ROLE
prompt =============================
prompt
create table mc.SEC_PARTY_ROLE
(
  party_type VARCHAR2(100) not null,
  party_id   VARCHAR2(200) not null,
  role_id    VARCHAR2(200) not null,
  is_default VARCHAR2(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_PARTY_ROLE
  is 'Party�ͽ�ɫ';
comment on column mc.SEC_PARTY_ROLE.party_type
  is 'Party����';
comment on column mc.SEC_PARTY_ROLE.party_id
  is 'Party���';
comment on column mc.SEC_PARTY_ROLE.role_id
  is '��ɫ���';
comment on column mc.SEC_PARTY_ROLE.is_default
  is '�Ƿ�ȱʡ�û�';
alter table mc.SEC_PARTY_ROLE
  add constraint PK_SEC_PARTY_ROLE primary key (PARTY_TYPE, PARTY_ID, ROLE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEC_PERMISSION
prompt =============================
prompt
create table mc.SEC_PERMISSION
(
  resource_type   VARCHAR2(100) not null,
  permission_type VARCHAR2(200) not null,
  description     VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_PERMISSION
  is 'Ȩ�޵������ֵ�';
comment on column mc.SEC_PERMISSION.resource_type
  is '��Դ���ͣ��˵�����Ŀ����Ŀ���ࡢ�ͻ�';
comment on column mc.SEC_PERMISSION.permission_type
  is '����Ȩ�ޣ�����VIEW��CREATE......';
comment on column mc.SEC_PERMISSION.description
  is '��ע';
alter table mc.SEC_PERMISSION
  add constraint PK_SEC_PERMISSION primary key (RESOURCE_TYPE, PERMISSION_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEC_RESOURCE_TYPE
prompt ================================
prompt
create table mc.SEC_RESOURCE_TYPE
(
  resource_type      VARCHAR2(100) not null,
  sequence_id        NUMBER(2),
  resource_type_code VARCHAR2(100),
  resource_type_name VARCHAR2(200),
  is_for_instance    VARCHAR2(10),
  description        VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_RESOURCE_TYPE
  is '��Դ���ͱ�';
comment on column mc.SEC_RESOURCE_TYPE.resource_type
  is '��Դ����, �˵�����Ŀ����Ŀ���ࡢ�ͻ�';
comment on column mc.SEC_RESOURCE_TYPE.sequence_id
  is '���';
comment on column mc.SEC_RESOURCE_TYPE.resource_type_code
  is '��Դ���ͱ��';
comment on column mc.SEC_RESOURCE_TYPE.resource_type_name
  is '��Դ��������';
comment on column mc.SEC_RESOURCE_TYPE.is_for_instance
  is '������Դ�Ƿ���Ҫ����Դʵ����Ȩ��Y�򲻿���ֱ����Ȩ���û�������Դ�Ľ�ɫ��N�����';
comment on column mc.SEC_RESOURCE_TYPE.description
  is '��ע';
alter table mc.SEC_RESOURCE_TYPE
  add constraint PK_SEC_RESOURCE_TYPE primary key (RESOURCE_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEC_ROLE
prompt =======================
prompt
create table mc.SEC_ROLE
(
  role_id        VARCHAR2(100) not null,
  role_type      VARCHAR2(100),
  resource_type  VARCHAR2(100),
  role_name      VARCHAR2(200),
  description    VARCHAR2(200),
  organizationid VARCHAR2(200),
  is_public      NUMBER(1) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_ROLE
  is '��ɫʵ��';
comment on column mc.SEC_ROLE.role_id
  is 'ϵͳ���';
comment on column mc.SEC_ROLE.role_type
  is '��ɫ���ͣ�����������SYSTEM�Ľ�ɫҳ�治�ɼ������ɱ༭�����Ǻ�̨��ʹ�ã�COMMON�����';
comment on column mc.SEC_ROLE.resource_type
  is '��Դ���ͣ��˵�����Ŀ����Ŀ���ࡢ�ͻ�';
comment on column mc.SEC_ROLE.role_name
  is '��ɫ����';
comment on column mc.SEC_ROLE.description
  is '��ע';
alter table mc.SEC_ROLE
  add constraint PK_SEC_ROLE primary key (ROLE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEC_ROLE_PERMISSION
prompt ==================================
prompt
create table mc.SEC_ROLE_PERMISSION
(
  role_id        VARCHAR2(100) not null,
  resource_type  VARCHAR2(200),
  resource_id    VARCHAR2(200) not null,
  parent_role_id VARCHAR2(200) not null,
  id             VARCHAR2(400) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_ROLE_PERMISSION
  is '��ɫӵ�е�Ȩ��';
comment on column mc.SEC_ROLE_PERMISSION.role_id
  is '��ɫ�ı��';
comment on column mc.SEC_ROLE_PERMISSION.resource_type
  is '��Դ����';
comment on column mc.SEC_ROLE_PERMISSION.resource_id
  is 'Ȩ��';
alter table mc.SEC_ROLE_PERMISSION
  add constraint PK_SEC_ROLE_PERMISSION primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEC_ROLE_TYPE
prompt ============================
prompt
create table mc.SEC_ROLE_TYPE
(
  role_type   VARCHAR2(100) not null,
  role_name   VARCHAR2(200),
  description VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_ROLE_TYPE
  is '��ɫ����';
comment on column mc.SEC_ROLE_TYPE.role_type
  is '��ɫ���ͣ�����������SYSTEM�Ľ�ɫҳ�治�ɼ������ɱ༭�����Ǻ�̨��ʹ�ã�COMMON�����';
comment on column mc.SEC_ROLE_TYPE.role_name
  is '��ɫ����';
comment on column mc.SEC_ROLE_TYPE.description
  is '��ע';
alter table mc.SEC_ROLE_TYPE
  add constraint PK_SEC_ROLE_TYPE primary key (ROLE_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEND
prompt ===================
prompt
create table mc.SEND
(
  send_id                VARCHAR2(200) not null,
  mobile_to              VARCHAR2(20) not null,
  send_msg               VARCHAR2(4000),
  sp_serv_no             VARCHAR2(20),
  sys_time               TIMESTAMP(6) default sysdate,
  prior_id               NUMBER(1) default 3,
  pre_send_time          TIMESTAMP(6) default sysdate,
  send_status            NUMBER(2) default 0,
  send_time              TIMESTAMP(6),
  com_rtn_time           TIMESTAMP(6),
  err_msg                VARCHAR2(500),
  report                 VARCHAR2(100),
  report_time            TIMESTAMP(6),
  channel_id             NUMBER(4) default 1,
  mobile_com             NUMBER(2),
  remark                 VARCHAR2(500),
  user_id                VARCHAR2(200),
  sequence               VARCHAR2(128),
  mobile_quantities      NUMBER(4) default 1,
  resend_times           NUMBER(1) default 0,
  signature              VARCHAR2(40),
  user_organization      VARCHAR2(200),
  batch_id               VARCHAR2(200),
  msg_type               VARCHAR2(50),
  consume_send_id        VARCHAR2(200),
  is_longsms             NUMBER(3) default 0,
  is_original_sms        NUMBER(3) default 0,
  originalsms_sendid     VARCHAR2(200),
  current_pageno         NUMBER(3),
  originalsms_totalpages NUMBER(3),
  longsms_tag            NUMBER(4),
  longsms_splited        NUMBER(1) default 0,
  gw_submit_time         TIMESTAMP(6),
  gw_done_time           TIMESTAMP(6),
  unit_price             NUMBER(10,3),
  return_fee             NUMBER(1) default 0,
  receive_id             VARCHAR2(200),
  operator_id            VARCHAR2(200),
  extra_keyword_num      VARCHAR2(200),
  mobile_from            VARCHAR2(2000),
  fee_mobile             VARCHAR2(2000),
  fee                    NUMBER(10,5),
  page_no                NUMBER(3),
  downsms_id             VARCHAR2(200),
  task_id                VARCHAR2(200),
  send_time2             DATE,
  com_rtn_time2          DATE,
  err_msg2               VARCHAR2(500),
  charge                 NUMBER(1),
  fail_resend_times      NUMBER(1),
  biz_type               NUMBER(3),
  cuurent_pageno         NUMBER(3),
  sort_id                NUMBER(3),
  submit_sequence_id     NUMBER(10),
  message_type           VARCHAR2(200),
  sys_id                 VARCHAR2(200),
  tmp_id                 VARCHAR2(200),
  wappush_url            VARCHAR2(200),
  return_msg_flag        VARCHAR2(200),
  md5                    VARCHAR2(100),
  sender_id              VARCHAR2(100),
  sender_orgid           VARCHAR2(100),
  return_mas_flag        VARCHAR2(300),
  send_deadline          TIMESTAMP(6),
  jx_smid                NUMBER(22),
  sms_author             VARCHAR2(200),
  account                VARCHAR2(200)
)
partition by range (SYS_TIME)
(
  partition P1 values less than (TIMESTAMP' 2013-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P923 values less than (TIMESTAMP' 2013-04-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P924 values less than (TIMESTAMP' 2013-04-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P21 values less than (TIMESTAMP' 2013-06-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P22 values less than (TIMESTAMP' 2013-06-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P23 values less than (TIMESTAMP' 2013-06-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P24 values less than (TIMESTAMP' 2013-06-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P25 values less than (TIMESTAMP' 2013-06-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P26 values less than (TIMESTAMP' 2013-06-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P27 values less than (TIMESTAMP' 2013-07-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P41 values less than (TIMESTAMP' 2013-07-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P43 values less than (TIMESTAMP' 2013-07-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P44 values less than (TIMESTAMP' 2013-07-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P45 values less than (TIMESTAMP' 2013-07-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P46 values less than (TIMESTAMP' 2013-07-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P47 values less than (TIMESTAMP' 2013-07-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P48 values less than (TIMESTAMP' 2013-07-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P49 values less than (TIMESTAMP' 2013-07-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P50 values less than (TIMESTAMP' 2013-07-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P61 values less than (TIMESTAMP' 2013-07-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P62 values less than (TIMESTAMP' 2013-07-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P63 values less than (TIMESTAMP' 2013-07-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P81 values less than (TIMESTAMP' 2013-07-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P82 values less than (TIMESTAMP' 2013-07-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P83 values less than (TIMESTAMP' 2013-07-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P84 values less than (TIMESTAMP' 2013-07-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P85 values less than (TIMESTAMP' 2013-07-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P86 values less than (TIMESTAMP' 2013-07-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P87 values less than (TIMESTAMP' 2013-07-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P88 values less than (TIMESTAMP' 2013-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P90 values less than (TIMESTAMP' 2013-08-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P101 values less than (TIMESTAMP' 2013-08-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P102 values less than (TIMESTAMP' 2013-08-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P103 values less than (TIMESTAMP' 2013-08-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P104 values less than (TIMESTAMP' 2013-08-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P105 values less than (TIMESTAMP' 2013-08-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P106 values less than (TIMESTAMP' 2013-08-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P107 values less than (TIMESTAMP' 2013-08-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P108 values less than (TIMESTAMP' 2013-08-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P109 values less than (TIMESTAMP' 2013-08-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P110 values less than (TIMESTAMP' 2013-08-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P111 values less than (TIMESTAMP' 2013-08-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P112 values less than (TIMESTAMP' 2013-08-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P113 values less than (TIMESTAMP' 2013-08-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P114 values less than (TIMESTAMP' 2013-08-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P115 values less than (TIMESTAMP' 2013-08-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P116 values less than (TIMESTAMP' 2013-08-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P117 values less than (TIMESTAMP' 2013-08-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P118 values less than (TIMESTAMP' 2013-08-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P119 values less than (TIMESTAMP' 2013-08-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P120 values less than (TIMESTAMP' 2013-08-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P121 values less than (TIMESTAMP' 2013-08-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P122 values less than (TIMESTAMP' 2013-08-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P123 values less than (TIMESTAMP' 2013-08-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P124 values less than (TIMESTAMP' 2013-08-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P125 values less than (TIMESTAMP' 2013-08-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P126 values less than (TIMESTAMP' 2013-08-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P127 values less than (TIMESTAMP' 2013-09-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P129 values less than (TIMESTAMP' 2013-09-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P130 values less than (TIMESTAMP' 2013-09-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P141 values less than (TIMESTAMP' 2013-09-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P142 values less than (TIMESTAMP' 2013-09-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P143 values less than (TIMESTAMP' 2013-09-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P161 values less than (TIMESTAMP' 2013-09-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P162 values less than (TIMESTAMP' 2013-09-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P163 values less than (TIMESTAMP' 2013-09-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P164 values less than (TIMESTAMP' 2013-09-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P165 values less than (TIMESTAMP' 2013-09-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P166 values less than (TIMESTAMP' 2013-09-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P181 values less than (TIMESTAMP' 2013-09-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P201 values less than (TIMESTAMP' 2013-09-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P221 values less than (TIMESTAMP' 2013-09-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P222 values less than (TIMESTAMP' 2013-09-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P241 values less than (TIMESTAMP' 2013-09-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P261 values less than (TIMESTAMP' 2013-09-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P281 values less than (TIMESTAMP' 2013-09-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P301 values less than (TIMESTAMP' 2013-09-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P302 values less than (TIMESTAMP' 2013-09-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P321 values less than (TIMESTAMP' 2013-09-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P341 values less than (TIMESTAMP' 2013-09-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P361 values less than (TIMESTAMP' 2013-09-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P381 values less than (TIMESTAMP' 2013-09-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P401 values less than (TIMESTAMP' 2013-09-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P421 values less than (TIMESTAMP' 2013-09-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P441 values less than (TIMESTAMP' 2013-09-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P442 values less than (TIMESTAMP' 2013-09-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P443 values less than (TIMESTAMP' 2013-10-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P481 values less than (TIMESTAMP' 2013-10-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P501 values less than (TIMESTAMP' 2013-10-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P502 values less than (TIMESTAMP' 2013-10-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P521 values less than (TIMESTAMP' 2013-10-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P541 values less than (TIMESTAMP' 2013-10-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P561 values less than (TIMESTAMP' 2013-10-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P581 values less than (TIMESTAMP' 2013-10-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P601 values less than (TIMESTAMP' 2013-10-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P602 values less than (TIMESTAMP' 2013-10-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P621 values less than (TIMESTAMP' 2013-10-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P641 values less than (TIMESTAMP' 2013-10-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P642 values less than (TIMESTAMP' 2013-10-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P661 values less than (TIMESTAMP' 2013-10-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P681 values less than (TIMESTAMP' 2013-10-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P682 values less than (TIMESTAMP' 2013-10-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P701 values less than (TIMESTAMP' 2013-10-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P702 values less than (TIMESTAMP' 2013-10-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P721 values less than (TIMESTAMP' 2013-10-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P741 values less than (TIMESTAMP' 2013-10-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P761 values less than (TIMESTAMP' 2013-10-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P781 values less than (TIMESTAMP' 2013-10-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P782 values less than (TIMESTAMP' 2013-10-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P783 values less than (TIMESTAMP' 2013-10-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P784 values less than (TIMESTAMP' 2013-10-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P785 values less than (TIMESTAMP' 2013-10-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P786 values less than (TIMESTAMP' 2013-11-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P802 values less than (TIMESTAMP' 2013-11-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P803 values less than (TIMESTAMP' 2013-11-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P821 values less than (TIMESTAMP' 2013-11-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P841 values less than (TIMESTAMP' 2013-11-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P42 values less than (TIMESTAMP' 2013-11-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P64 values less than (TIMESTAMP' 2013-11-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P89 values less than (TIMESTAMP' 2013-11-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P91 values less than (TIMESTAMP' 2013-11-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P128 values less than (TIMESTAMP' 2013-11-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P131 values less than (TIMESTAMP' 2013-11-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P132 values less than (TIMESTAMP' 2013-11-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P133 values less than (TIMESTAMP' 2013-11-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P134 values less than (TIMESTAMP' 2013-11-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P135 values less than (TIMESTAMP' 2013-11-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P136 values less than (TIMESTAMP' 2013-11-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P144 values less than (TIMESTAMP' 2013-11-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P167 values less than (TIMESTAMP' 2013-12-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P182 values less than (TIMESTAMP' 2013-12-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P223 values less than (TIMESTAMP' 2013-12-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P242 values less than (TIMESTAMP' 2013-12-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P262 values less than (TIMESTAMP' 2013-12-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P282 values less than (TIMESTAMP' 2013-12-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P303 values less than (TIMESTAMP' 2013-12-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P322 values less than (TIMESTAMP' 2013-12-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P342 values less than (TIMESTAMP' 2013-12-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P362 values less than (TIMESTAMP' 2013-12-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P363 values less than (TIMESTAMP' 2013-12-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P364 values less than (TIMESTAMP' 2013-12-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P382 values less than (TIMESTAMP' 2013-12-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P402 values less than (TIMESTAMP' 2013-12-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P403 values less than (TIMESTAMP' 2014-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P422 values less than (TIMESTAMP' 2014-01-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P423 values less than (TIMESTAMP' 2014-01-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P444 values less than (TIMESTAMP' 2014-01-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P463 values less than (TIMESTAMP' 2014-01-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P482 values less than (TIMESTAMP' 2014-01-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P503 values less than (TIMESTAMP' 2014-01-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P522 values less than (TIMESTAMP' 2014-01-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P542 values less than (TIMESTAMP' 2014-01-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P562 values less than (TIMESTAMP' 2014-01-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P582 values less than (TIMESTAMP' 2014-01-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P603 values less than (TIMESTAMP' 2014-01-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P622 values less than (TIMESTAMP' 2014-02-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P623 values less than (TIMESTAMP' 2014-02-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P643 values less than (TIMESTAMP' 2014-02-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P662 values less than (TIMESTAMP' 2014-02-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P683 values less than (TIMESTAMP' 2014-02-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P722 values less than (TIMESTAMP' 2014-02-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P684 values less than (TIMESTAMP' 2014-02-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P703 values less than (TIMESTAMP' 2014-03-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P704 values less than (TIMESTAMP' 2014-03-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P724 values less than (TIMESTAMP' 2014-03-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P723 values less than (TIMESTAMP' 2014-03-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P762 values less than (TIMESTAMP' 2014-03-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P787 values less than (TIMESTAMP' 2014-03-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P804 values less than (TIMESTAMP' 2014-03-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P842 values less than (TIMESTAMP' 2014-03-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P861 values less than (TIMESTAMP' 2014-03-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P881 values less than (TIMESTAMP' 2014-03-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P902 values less than (TIMESTAMP' 2014-03-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P922 values less than (TIMESTAMP' 2014-03-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P942 values less than (TIMESTAMP' 2014-04-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P943 values less than (TIMESTAMP' 2014-04-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P962 values less than (TIMESTAMP' 2014-04-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P963 values less than (TIMESTAMP' 2014-04-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1062 values less than (TIMESTAMP' 2014-04-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1063 values less than (TIMESTAMP' 2014-04-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P51 values less than (TIMESTAMP' 2014-04-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P65 values less than (TIMESTAMP' 2014-04-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P92 values less than (TIMESTAMP' 2014-04-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P93 values less than (TIMESTAMP' 2014-04-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P94 values less than (TIMESTAMP' 2014-04-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P137 values less than (TIMESTAMP' 2014-04-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P52 values less than (TIMESTAMP' 2014-04-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P138 values less than (TIMESTAMP' 2014-05-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P139 values less than (TIMESTAMP' 2014-05-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P140 values less than (TIMESTAMP' 2014-05-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P66 values less than (TIMESTAMP' 2014-05-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P95 values less than (TIMESTAMP' 2014-05-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P145 values less than (TIMESTAMP' 2014-05-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P243 values less than (TIMESTAMP' 2014-05-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P244 values less than (TIMESTAMP' 2014-05-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P323 values less than (TIMESTAMP' 2014-05-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P343 values less than (TIMESTAMP' 2014-05-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P365 values less than (TIMESTAMP' 2014-05-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P366 values less than (TIMESTAMP' 2014-06-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P367 values less than (TIMESTAMP' 2014-06-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P368 values less than (TIMESTAMP' 2014-06-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P369 values less than (TIMESTAMP' 2014-06-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P370 values less than (TIMESTAMP' 2014-06-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P168 values less than (TIMESTAMP' 2014-07-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P183 values less than (TIMESTAMP' 2014-07-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P383 values less than (TIMESTAMP' 2014-07-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P372 values less than (TIMESTAMP' 2014-07-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P424 values less than (TIMESTAMP' 2014-07-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P483 values less than (TIMESTAMP' 2014-07-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P445 values less than (TIMESTAMP' 2014-07-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P446 values less than (TIMESTAMP' 2014-07-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P461 values less than (TIMESTAMP' 2014-07-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P484 values less than (TIMESTAMP' 2014-07-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P504 values less than (TIMESTAMP' 2014-07-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P505 values less than (TIMESTAMP' 2014-07-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P523 values less than (TIMESTAMP' 2014-07-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P524 values less than (TIMESTAMP' 2014-07-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P525 values less than (TIMESTAMP' 2014-07-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P526 values less than (TIMESTAMP' 2014-07-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P543 values less than (TIMESTAMP' 2014-07-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P544 values less than (TIMESTAMP' 2014-07-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P545 values less than (TIMESTAMP' 2014-07-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P546 values less than (TIMESTAMP' 2014-07-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P547 values less than (TIMESTAMP' 2014-07-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P563 values less than (TIMESTAMP' 2014-07-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P564 values less than (TIMESTAMP' 2014-07-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P202 values less than (TIMESTAMP' 2014-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P245 values less than (TIMESTAMP' 2014-08-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P224 values less than (TIMESTAMP' 2014-08-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P225 values less than (TIMESTAMP' 2014-08-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P604 values less than (TIMESTAMP' 2014-08-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P263 values less than (TIMESTAMP' 2014-08-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P644 values less than (TIMESTAMP' 2014-08-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P404 values less than (TIMESTAMP' 2014-08-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P283 values less than (TIMESTAMP' 2014-08-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P304 values less than (TIMESTAMP' 2014-08-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P583 values less than (TIMESTAMP' 2014-08-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P624 values less than (TIMESTAMP' 2014-08-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P663 values less than (TIMESTAMP' 2014-08-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P707 values less than (TIMESTAMP' 2014-08-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P685 values less than (TIMESTAMP' 2014-08-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P705 values less than (TIMESTAMP' 2014-08-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P706 values less than (TIMESTAMP' 2014-08-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P708 values less than (TIMESTAMP' 2014-09-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P709 values less than (TIMESTAMP' 2014-09-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P727 values less than (TIMESTAMP' 2014-10-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P725 values less than (TIMESTAMP' 2014-10-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P726 values less than (TIMESTAMP' 2014-10-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P763 values less than (TIMESTAMP' 2014-11-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P742 values less than (TIMESTAMP' 2014-11-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P788 values less than (TIMESTAMP' 2014-11-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P801 values less than (TIMESTAMP' 2014-12-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P96 values less than (TIMESTAMP' 2014-12-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P146 values less than (TIMESTAMP' 2014-12-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P169 values less than (TIMESTAMP' 2014-12-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P184 values less than (TIMESTAMP' 2014-12-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P203 values less than (TIMESTAMP' 2014-12-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P226 values less than (TIMESTAMP' 2014-12-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P246 values less than (TIMESTAMP' 2014-12-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P264 values less than (TIMESTAMP' 2014-12-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P284 values less than (TIMESTAMP' 2014-12-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P285 values less than (TIMESTAMP' 2014-12-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P305 values less than (TIMESTAMP' 2014-12-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P324 values less than (TIMESTAMP' 2014-12-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P325 values less than (TIMESTAMP' 2014-12-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P344 values less than (TIMESTAMP' 2015-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P345 values less than (TIMESTAMP' 2015-01-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P346 values less than (TIMESTAMP' 2015-01-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P371 values less than (TIMESTAMP' 2015-01-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P384 values less than (TIMESTAMP' 2015-01-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P405 values less than (TIMESTAMP' 2015-01-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P425 values less than (TIMESTAMP' 2015-01-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P447 values less than (TIMESTAMP' 2015-01-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P462 values less than (TIMESTAMP' 2015-01-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P485 values less than (TIMESTAMP' 2015-01-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P506 values less than (TIMESTAMP' 2015-01-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P527 values less than (TIMESTAMP' 2015-01-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P548 values less than (TIMESTAMP' 2015-01-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P565 values less than (TIMESTAMP' 2015-01-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P584 values less than (TIMESTAMP' 2015-01-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P605 values less than (TIMESTAMP' 2015-01-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P625 values less than (TIMESTAMP' 2015-01-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P645 values less than (TIMESTAMP' 2015-01-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P664 values less than (TIMESTAMP' 2015-02-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P686 values less than (TIMESTAMP' 2015-02-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P710 values less than (TIMESTAMP' 2015-03-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P764 values less than (TIMESTAMP' 2015-04-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P765 values less than (TIMESTAMP' 2015-04-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P766 values less than (TIMESTAMP' 2015-04-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P767 values less than (TIMESTAMP' 2015-04-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P768 values less than (TIMESTAMP' 2015-04-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P769 values less than (TIMESTAMP' 2015-04-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P770 values less than (TIMESTAMP' 2015-04-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P862 values less than (TIMESTAMP' 2015-04-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P789 values less than (TIMESTAMP' 2015-04-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P863 values less than (TIMESTAMP' 2015-06-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P864 values less than (TIMESTAMP' 2015-06-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P882 values less than (TIMESTAMP' 2015-06-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P901 values less than (TIMESTAMP' 2015-06-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P921 values less than (TIMESTAMP' 2015-06-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P941 values less than (TIMESTAMP' 2015-06-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P961 values less than (TIMESTAMP' 2015-06-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P964 values less than (TIMESTAMP' 2015-06-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P981 values less than (TIMESTAMP' 2015-06-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1001 values less than (TIMESTAMP' 2015-06-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1002 values less than (TIMESTAMP' 2015-06-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1021 values less than (TIMESTAMP' 2015-07-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1041 values less than (TIMESTAMP' 2015-07-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1042 values less than (TIMESTAMP' 2015-07-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1043 values less than (TIMESTAMP' 2015-07-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1061 values less than (TIMESTAMP' 2015-07-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1081 values less than (TIMESTAMP' 2015-07-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1101 values less than (TIMESTAMP' 2015-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1121 values less than (TIMESTAMP' 2015-08-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1141 values less than (TIMESTAMP' 2015-08-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table mc.SEND
  is '���ж�����Ϣ��';
comment on column mc.SEND.send_id
  is '���ж�����ţ����ж��ŵ�Ψһ��ʶ';
comment on column mc.SEND.mobile_to
  is 'Ŀ���ֻ���';
comment on column mc.SEND.send_msg
  is '��������';
comment on column mc.SEND.sp_serv_no
  is '��չ��';
comment on column mc.SEND.sys_time
  is '���ʱ��';
comment on column mc.SEND.prior_id
  is '���ȼ���ֻ��3�����ȼ���3Ϊ��� ,8Ϊ��ͣ�5Ϊ�е����ȼ�';
comment on column mc.SEND.pre_send_time
  is 'Ԥ�Ʒ���ʱ��';
comment on column mc.SEND.send_status
  is '����״̬ -2δ�Ʒ�, 0����, 1���ύ, 2������, 4��ɾ��, 5���ͳɹ�, 6����ʧ��, 7ϵͳ������.8 Υ���ʱ�������״̬��-1�ƻ����� 3�ط��� 8�����ط�ʧ�ܡ���������';
comment on column mc.SEND.send_time
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column mc.SEND.com_rtn_time
  is '���ͺ��ƶ�����ͨ���ط��ؽ����ʱ��';
comment on column mc.SEND.err_msg
  is '����ʧ��ʱ���ƶ���ͨ���ط��صĴ�����Ϣ��ֻ���ڷ���ʧ��ʱ�����ֶ���ֵ������ʱ��δ��';
comment on column mc.SEND.report
  is '�ֻ�����״̬���档�����ֶ�';
comment on column mc.SEND.report_time
  is '�ֻ�����״̬���淵��ʱ��';
comment on column mc.SEND.channel_id
  is 'ͨ��ID';
comment on column mc.SEND.mobile_com
  is '��Ӫ��ID��1Ϊ�ƶ���2Ϊ��ͨ,3Ϊ����';
comment on column mc.SEND.remark
  is '��ע��Ϣ����Ϊ�ⲿϵͳ��չ�ã�CC����ϵͳ���ֶ���д�����˺�';
comment on column mc.SEND.user_id
  is '���û�id����Ϊ����������';
comment on column mc.SEND.sequence
  is '��������';
comment on column mc.SEND.mobile_quantities
  is '������Ϣ������';
comment on column mc.SEND.resend_times
  is 'ƽ̨�������ύ�ö��ŵĴ���';
comment on column mc.SEND.signature
  is 'ǩ��';
comment on column mc.SEND.user_organization
  is '�û���id';
comment on column mc.SEND.batch_id
  is '���κ�';
comment on column mc.SEND.msg_type
  is '��Ϣ����,��¼���Ų����ķ�ʽ';
comment on column mc.SEND.consume_send_id
  is '�ͻ��˶���id��';
comment on column mc.SEND.is_longsms
  is '�ö����Ƿ��ǳ�����,0:���ǳ�����,1:�ǳ�����';
comment on column mc.SEND.is_original_sms
  is '�ö����Ƿ���ԭʼ����,��ԭʼ����ָ�����ŷ���ʱ��ֳ��Ķ���,0:��ԭʼ����, 1:����ԭʼ����';
comment on column mc.SEND.originalsms_sendid
  is 'ԭʼ���ű�ţ���������Ϊ�ɳ����Ų�ֳɵĶ̶���ʱ, �������ݴ˱�Ų�ѯ��ԭʼ����';
comment on column mc.SEND.current_pageno
  is '��ǰ���ŵ�ҳ��,�������ŵĵڼ����̶���';
comment on column mc.SEND.originalsms_totalpages
  is '�����̶������������Ź��ж��ŵ�ҳ��';
comment on column mc.SEND.longsms_tag
  is '�����Ŷ���ʶ����ͬһ�������ŵĶ̶��Ÿñ�ʶ��ͬ';
comment on column mc.SEND.longsms_splited
  is '�������Ƿ񱻲�֣�0û�б���ֻ�������ͨ���ţ�1�Ѿ�����֡�����ֵĶ��Ų�ѯͳ��ʱ��Ӧ����������Ĭ��0';
comment on column mc.SEND.gw_submit_time
  is '�ύ�����ص�ʱ��';
comment on column mc.SEND.gw_done_time
  is '�ֻ��յ����ŵ�ʱ��';
comment on column mc.SEND.unit_price
  is '���ŵ���';
comment on column mc.SEND.return_fee
  is '�Ƿ��Ѹ��������ŷ�������,0:û����,1:�ѷ���';
comment on column mc.SEND.receive_id
  is 'CMPP�˺�';
comment on column mc.SEND.operator_id
  is '���ŷ�����(���ŷ��͵Ĳ�����)';
alter table mc.SEND
  add constraint PK_SEND primary key (SEND_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_BATCH_ID on mc.SEND (BATCH_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_CHANNEL on mc.SEND (CHANNEL_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_ID_STATUS on mc.SEND (SEND_ID, SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_MOBILE on mc.SEND (MOBILE_TO)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_SEQUENCE on mc.SEND (SEQUENCE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_STATS_CHAN on mc.SEND (CHANNEL_ID, SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_SYS_TIME on mc.SEND (SYS_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEND_SPEED_TIME
prompt ==============================
prompt
create table mc.SEND_SPEED_TIME
(
  id            VARCHAR2(200) not null,
  not_sendcount VARCHAR2(20),
  channel       VARCHAR2(20),
  speed         VARCHAR2(20),
  time          VARCHAR2(100),
  status        NUMBER(2),
  sys_time      VARCHAR2(50),
  create_time   DATE default sysdate
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SEND_SPEED_TIME
  is '����ÿ�μ��㷢���������Ҫ����ʱ���¼';
comment on column mc.SEND_SPEED_TIME.id
  is 'ϵͳid';
comment on column mc.SEND_SPEED_TIME.not_sendcount
  is '������������(״̬����0,2)';
comment on column mc.SEND_SPEED_TIME.channel
  is 'ͨ������';
comment on column mc.SEND_SPEED_TIME.speed
  is '�ٶ�';
comment on column mc.SEND_SPEED_TIME.time
  is '��Ҫ���ѵ�ʱ��,��λ����';
comment on column mc.SEND_SPEED_TIME.status
  is '1����,2��æ,3�쳣';
comment on column mc.SEND_SPEED_TIME.sys_time
  is '��ȡ��Ϣ��ʱ��';
comment on column mc.SEND_SPEED_TIME.create_time
  is '����ʱ��';
alter table mc.SEND_SPEED_TIME
  add constraint PK_SEND_SPEED_TIME primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SEND_STATICS_QUANTITY
prompt ====================================
prompt
create table mc.SEND_STATICS_QUANTITY
(
  channel_id          NUMBER(18) not null,
  total_quantity      NUMBER(18) default 0,
  wait_send_quantity  NUMBER(18) default 0,
  sending_quantity    NUMBER(18) default 0,
  sent_quantity       NUMBER(18) default 0,
  success_quantity    NUMBER(18) default 0,
  failed_quantity     NUMBER(18) default 0,
  black_quantity      NUMBER(18) default 0,
  prohibited_quantity NUMBER(18) default 0,
  receive_quantity    NUMBER(18) default 0,
  create_time         DATE not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SEND_STATICS_QUANTITY
  is '��״̬��������';
comment on column mc.SEND_STATICS_QUANTITY.channel_id
  is '0Ϊ����ͨ��';
comment on column mc.SEND_STATICS_QUANTITY.total_quantity
  is '����';
comment on column mc.SEND_STATICS_QUANTITY.wait_send_quantity
  is '����������,״̬Ϊ0';
comment on column mc.SEND_STATICS_QUANTITY.sending_quantity
  is '����������,״̬Ϊ2';
comment on column mc.SEND_STATICS_QUANTITY.sent_quantity
  is '���ύ����';
comment on column mc.SEND_STATICS_QUANTITY.success_quantity
  is '�ɹ�����';
comment on column mc.SEND_STATICS_QUANTITY.failed_quantity
  is 'ʧ������';
comment on column mc.SEND_STATICS_QUANTITY.black_quantity
  is '����������';
comment on column mc.SEND_STATICS_QUANTITY.prohibited_quantity
  is 'Υ��������';
comment on column mc.SEND_STATICS_QUANTITY.receive_quantity
  is '��������';
comment on column mc.SEND_STATICS_QUANTITY.create_time
  is '������ʱ��';
alter table mc.SEND_STATICS_QUANTITY
  add constraint PK_SEND_STATICS_QUANTITY primary key (CHANNEL_ID, CREATE_TIME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SEND_STATICS_QUANTITY_TEMP
prompt =========================================
prompt
create table mc.SEND_STATICS_QUANTITY_TEMP
(
  channel_id          NUMBER(18) not null,
  total_quantity      NUMBER(18) default 0,
  wait_send_quantity  NUMBER(18) default 0,
  sending_quantity    NUMBER(18) default 0,
  sent_quantity       NUMBER(18) default 0,
  success_quantity    NUMBER(18) default 0,
  failed_quantity     NUMBER(18) default 0,
  black_quantity      NUMBER(18) default 0,
  prohibited_quantity NUMBER(18) default 0,
  receive_quantity    NUMBER(18) default 0,
  create_time         DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SEND_STATICS_QUANTITY_TEMP
  is '��״̬��������';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.channel_id
  is '0Ϊ����ͨ��';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.total_quantity
  is '����';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.wait_send_quantity
  is '����������,״̬Ϊ0';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.sending_quantity
  is '����������,״̬Ϊ2';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.sent_quantity
  is '���ύ����';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.success_quantity
  is '�ɹ�����';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.failed_quantity
  is 'ʧ������';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.black_quantity
  is '����������';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.prohibited_quantity
  is 'Υ��������';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.receive_quantity
  is '��������';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.create_time
  is '������ʱ��';
alter table mc.SEND_STATICS_QUANTITY_TEMP
  add constraint PK_SEND_STATICS_QUANTITY_TEMP primary key (CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SEQUENCE_VALUE_ITEM
prompt ==================================
prompt
create table mc.SEQUENCE_VALUE_ITEM
(
  seq_name              VARCHAR2(60) not null,
  seq_id                NUMBER(18),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SEQUENCE_VALUE_ITEM
  add constraint PK_SEQUENCE_VALUE_ITEM primary key (SEQ_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.SQNC_VL_ITM_TXCRTS on mc.SEQUENCE_VALUE_ITEM (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.SQNC_VL_ITM_TXSTMP on mc.SEQUENCE_VALUE_ITEM (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_ACCOUNT_CHANNEL
prompt ==================================
prompt
create table mc.SGW_ACCOUNT_CHANNEL
(
  id                NUMBER(18) not null,
  sgw_id            NUMBER(18),
  sp_number         VARCHAR2(20) not null,
  channel_id        NUMBER(4) not null,
  sub_extend_number VARCHAR2(5),
  mobile_com        NUMBER(1) not null,
  channel_status    CHAR(1) default '1' not null,
  sys_time          DATE default SYSDATE not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_ACCOUNT_CHANNEL
  is 'CMPP�˻�ͨ����';
comment on column mc.SGW_ACCOUNT_CHANNEL.id
  is '����';
comment on column mc.SGW_ACCOUNT_CHANNEL.sgw_id
  is '����ID';
comment on column mc.SGW_ACCOUNT_CHANNEL.sp_number
  is '�ط���';
comment on column mc.SGW_ACCOUNT_CHANNEL.channel_id
  is 'ͨ��ID';
comment on column mc.SGW_ACCOUNT_CHANNEL.sub_extend_number
  is '����չ��';
comment on column mc.SGW_ACCOUNT_CHANNEL.mobile_com
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ, 3:����';
comment on column mc.SGW_ACCOUNT_CHANNEL.channel_status
  is 'ͨ��״̬ 0:ͣ��, 1:����';
comment on column mc.SGW_ACCOUNT_CHANNEL.sys_time
  is '���ʱ��';
alter table mc.SGW_ACCOUNT_CHANNEL
  add constraint PK_SGW_ACCOUNT_CHANNEL primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_ACCOUNT_INFO
prompt ===============================
prompt
create table mc.SGW_ACCOUNT_INFO
(
  sgw_id               NUMBER(18) not null,
  user_id              VARCHAR2(200),
  account_pass         VARCHAR2(16),
  registed_ip          VARCHAR2(200),
  prior_id             CHAR(1),
  flux_limit           NUMBER(4),
  mt_worker_num        NUMBER(4),
  mt_cache_num         NUMBER(10),
  server_active_test   CHAR(1),
  is_channel_account   CHAR(1),
  signature_type       CHAR(1),
  check_prohibitedword CHAR(1),
  comments             VARCHAR2(200),
  sys_time             DATE default SYSDATE,
  trustedaccount       VARCHAR2(5) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_ACCOUNT_INFO
  is 'CMPP������Ϣ��';
comment on column mc.SGW_ACCOUNT_INFO.sgw_id
  is '����ID';
comment on column mc.SGW_ACCOUNT_INFO.user_id
  is '�û�UUID';
comment on column mc.SGW_ACCOUNT_INFO.account_pass
  is 'CMPP�˻���������';
comment on column mc.SGW_ACCOUNT_INFO.registed_ip
  is '��֤IP';
comment on column mc.SGW_ACCOUNT_INFO.prior_id
  is '���ȼ�';
comment on column mc.SGW_ACCOUNT_INFO.flux_limit
  is '����';
comment on column mc.SGW_ACCOUNT_INFO.mt_worker_num
  is '���д����߳�����';
comment on column mc.SGW_ACCOUNT_INFO.mt_cache_num
  is '���л�����г���';
comment on column mc.SGW_ACCOUNT_INFO.server_active_test
  is '����˷�����·��� 0:������, 1:����';
comment on column mc.SGW_ACCOUNT_INFO.is_channel_account
  is '�Ƿ������˺ţ� 0:��, 1:��';
comment on column mc.SGW_ACCOUNT_INFO.signature_type
  is 'ǩ�����ͣ�1����ͨ����ǩ����2���Ӷ˿�����ǩ����3������ǩ������Ҫͨ��ǩ���ع��˼�飩';
comment on column mc.SGW_ACCOUNT_INFO.check_prohibitedword
  is '�Ƿ���Υ���ʣ� 0:��, 1:��';
comment on column mc.SGW_ACCOUNT_INFO.comments
  is '��ע';
comment on column mc.SGW_ACCOUNT_INFO.sys_time
  is '���ʱ��';
comment on column mc.SGW_ACCOUNT_INFO.trustedaccount
  is '�Ƿ��ǿ����û���0��nullʱ�ǲ������˻���1�������˻�';
alter table mc.SGW_ACCOUNT_INFO
  add constraint PK_SGW_ACCOUNT_INFO primary key (SGW_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SGW_ACCOUNT_INFO
  add constraint FK_SGW_ACCO_REFERENCE_USER_INF foreign key (USER_ID)
  references mc.USER_INFO (USER_ID);
create index mc.IDX_SGW_ACCOUNT_INFO_ID_UID on mc.SGW_ACCOUNT_INFO (SGW_ID, USER_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_CUSTOMER
prompt ===========================
prompt
create table mc.SGW_CUSTOMER
(
  customer_id       NUMBER(18) not null,
  customer_name     VARCHAR2(100),
  p_customer_id     NUMBER(18) not null,
  user_id           VARCHAR2(200) not null,
  org_id            VARCHAR2(200) not null,
  sub_extend_number VARCHAR2(5),
  comments          VARCHAR2(200),
  customer_status   CHAR(1),
  sys_time          DATE default SYSDATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_CUSTOMER
  is '���ؿͻ���';
comment on column mc.SGW_CUSTOMER.customer_id
  is '�ͻ�ID';
comment on column mc.SGW_CUSTOMER.customer_name
  is '�ͻ�����';
comment on column mc.SGW_CUSTOMER.p_customer_id
  is '���ͻ�ID������Ϊ0';
comment on column mc.SGW_CUSTOMER.user_id
  is '�û�UUID';
comment on column mc.SGW_CUSTOMER.org_id
  is '�������';
comment on column mc.SGW_CUSTOMER.sub_extend_number
  is '����չ��';
comment on column mc.SGW_CUSTOMER.comments
  is '��ע';
comment on column mc.SGW_CUSTOMER.customer_status
  is '�˺�״̬ 0:ͣ��, 1:����';
comment on column mc.SGW_CUSTOMER.sys_time
  is '���ʱ��';
alter table mc.SGW_CUSTOMER
  add constraint PK_SGW_CHANNEL_CUSTOMER primary key (CUSTOMER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_MO_TASK
prompt ==========================
prompt
create table mc.SGW_MO_TASK
(
  receive_id         NUMBER(18) not null,
  mobile_from        VARCHAR2(30),
  receive_msg        VARCHAR2(200),
  sp_no              VARCHAR2(20),
  read_user_group_id VARCHAR2(200),
  user_id            VARCHAR2(50),
  channel_id         NUMBER(2),
  receive_time       DATE,
  receive_status     CHAR(1),
  next_push_time     DATE,
  push_times         NUMBER(18)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_MO_TASK
  is '���ж��������HTTP���ʹ����';
comment on column mc.SGW_MO_TASK.mobile_from
  is '�����ֻ�����';
alter table mc.SGW_MO_TASK
  add constraint PK_SGW_MO_TASK primary key (RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_REPORT_TASK
prompt ==============================
prompt
create table mc.SGW_REPORT_TASK
(
  task_id           NUMBER(18) not null,
  send_id           VARCHAR2(200),
  mobile_to         VARCHAR2(30),
  destnation_id     VARCHAR2(30),
  msg_id            VARCHAR2(20),
  user_organization VARCHAR2(200),
  user_id           VARCHAR2(50),
  channel_id        NUMBER(2),
  sys_time          DATE,
  submit_time       DATE,
  done_time         DATE,
  report_time       DATE,
  push_status       CHAR(1),
  next_push_time    DATE,
  push_times        NUMBER(18),
  stat              VARCHAR2(20) default 'DELIVRD'
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_REPORT_TASK
  is '��������״̬���������';
comment on column mc.SGW_REPORT_TASK.task_id
  is '������';
comment on column mc.SGW_REPORT_TASK.send_id
  is '���ű��';
comment on column mc.SGW_REPORT_TASK.mobile_to
  is '�ֻ���';
comment on column mc.SGW_REPORT_TASK.destnation_id
  is '�ط���';
comment on column mc.SGW_REPORT_TASK.msg_id
  is '������ͻ��˵Ķ��ű��';
comment on column mc.SGW_REPORT_TASK.user_organization
  is '�������';
comment on column mc.SGW_REPORT_TASK.user_id
  is '�û����';
comment on column mc.SGW_REPORT_TASK.channel_id
  is 'ͨ�����';
comment on column mc.SGW_REPORT_TASK.sys_time
  is '���ʱ��';
comment on column mc.SGW_REPORT_TASK.submit_time
  is '�����ύʱ��';
comment on column mc.SGW_REPORT_TASK.done_time
  is '���ŷ���ʱ��';
comment on column mc.SGW_REPORT_TASK.report_time
  is '״̬����ʱ��';
comment on column mc.SGW_REPORT_TASK.push_status
  is '����״̬��0�������ͣ�2�������У�5�����ͳɹ���6������ʧ��';
comment on column mc.SGW_REPORT_TASK.next_push_time
  is '�´�����ʱ��';
comment on column mc.SGW_REPORT_TASK.push_times
  is '���ʹ���';
comment on column mc.SGW_REPORT_TASK.stat
  is '״̬��';
alter table mc.SGW_REPORT_TASK
  add constraint PK_SGW_REPORT_TASK primary key (TASK_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SGW_REPORT_TASK_SENDID on mc.SGW_REPORT_TASK (SEND_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_REPORT_TASK_HIS
prompt ==================================
prompt
create table mc.SGW_REPORT_TASK_HIS
(
  task_id           NUMBER(18) not null,
  send_id           VARCHAR2(200),
  mobile_to         VARCHAR2(30),
  destnation_id     VARCHAR2(30),
  stat              VARCHAR2(20),
  msg_id            VARCHAR2(20),
  user_organization VARCHAR2(200),
  user_id           VARCHAR2(50),
  channel_id        NUMBER(2),
  sys_time          DATE,
  submit_time       DATE,
  done_time         DATE,
  report_time       DATE,
  push_status       CHAR(1),
  next_push_time    DATE,
  push_times        NUMBER(18),
  log_time          DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_REPORT_TASK_HIS
  is '����״̬������������ʷ��';
comment on column mc.SGW_REPORT_TASK_HIS.task_id
  is '������';
comment on column mc.SGW_REPORT_TASK_HIS.send_id
  is '���ű��';
comment on column mc.SGW_REPORT_TASK_HIS.mobile_to
  is '�ֻ���';
comment on column mc.SGW_REPORT_TASK_HIS.destnation_id
  is '�ط���';
comment on column mc.SGW_REPORT_TASK_HIS.stat
  is '״̬��';
comment on column mc.SGW_REPORT_TASK_HIS.msg_id
  is '������ͻ��˵Ķ��ű��';
comment on column mc.SGW_REPORT_TASK_HIS.user_organization
  is '�������';
comment on column mc.SGW_REPORT_TASK_HIS.user_id
  is '�û����';
comment on column mc.SGW_REPORT_TASK_HIS.channel_id
  is 'ͨ�����';
comment on column mc.SGW_REPORT_TASK_HIS.sys_time
  is '���ʱ��';
comment on column mc.SGW_REPORT_TASK_HIS.submit_time
  is '�����ύʱ��';
comment on column mc.SGW_REPORT_TASK_HIS.done_time
  is '���ŷ���ʱ��';
comment on column mc.SGW_REPORT_TASK_HIS.report_time
  is '״̬����ʱ��';
comment on column mc.SGW_REPORT_TASK_HIS.push_status
  is '����״̬';
comment on column mc.SGW_REPORT_TASK_HIS.next_push_time
  is '�´�����ʱ��';
comment on column mc.SGW_REPORT_TASK_HIS.push_times
  is '���ʹ���';
alter table mc.SGW_REPORT_TASK_HIS
  add constraint PK_SGW_REPORT_TASK_HIS primary key (TASK_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SGW_REPORT_TASK_HIS_SENDID on mc.SGW_REPORT_TASK_HIS (SEND_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_SIGNATURE_POOL
prompt =================================
prompt
create table mc.SGW_SIGNATURE_POOL
(
  signature_id     NUMBER(18) not null,
  customer_id      NUMBER(18),
  signature        VARCHAR2(40) not null,
  description      VARCHAR2(200),
  sort_index       NUMBER(4),
  do_append_msg    CHAR(1),
  append_msg       VARCHAR2(100),
  black_level      CHAR(1) default '0' not null,
  comments         VARCHAR2(200),
  signature_status CHAR(1) default '1',
  sys_time         DATE default SYSDATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_SIGNATURE_POOL
  is '���ؿͻ�ǩ���ر�';
comment on column mc.SGW_SIGNATURE_POOL.signature_id
  is 'ǩ��ID';
comment on column mc.SGW_SIGNATURE_POOL.customer_id
  is '�ͻ�ID';
comment on column mc.SGW_SIGNATURE_POOL.signature
  is 'ǩ��';
comment on column mc.SGW_SIGNATURE_POOL.description
  is '����';
comment on column mc.SGW_SIGNATURE_POOL.sort_index
  is '������';
comment on column mc.SGW_SIGNATURE_POOL.do_append_msg
  is '�Ƿ��Զ���Ӷ������� 0:�����, 1:���';
comment on column mc.SGW_SIGNATURE_POOL.append_msg
  is '�Զ���ӵĶ�������';
comment on column mc.SGW_SIGNATURE_POOL.black_level
  is '����������0��ֻ���BLACK��������1�����BLACK��BLACK_CSMD��������2�����BLACK��BLACK_CSMD��BLACK_ZHUOYUE������';
comment on column mc.SGW_SIGNATURE_POOL.comments
  is '��ע';
comment on column mc.SGW_SIGNATURE_POOL.signature_status
  is '״̬ 0:ͣ��, 1:����';
comment on column mc.SGW_SIGNATURE_POOL.sys_time
  is '���ʱ��';
alter table mc.SGW_SIGNATURE_POOL
  add constraint PK_SGW_SIGNATURE_POOL primary key (SIGNATURE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index mc.UDX_SGW_SIGNATURE on mc.SGW_SIGNATURE_POOL (SIGNATURE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_BIR_CONFIG
prompt =============================
prompt
create table mc.SMS_BIR_CONFIG
(
  sms_bir_config_id      VARCHAR2(200) not null,
  user_group_id          VARCHAR2(200) not null,
  user_group_name        VARCHAR2(200),
  do_congratulations     VARCHAR2(20),
  source_entity_name     VARCHAR2(40),
  account_name_field     VARCHAR2(200),
  account_birthday_field VARCHAR2(200),
  mobile_number_field    VARCHAR2(200),
  message_template       VARCHAR2(200),
  send_time              DATE,
  use_account_info       VARCHAR2(20),
  use_ods                VARCHAR2(20),
  group_ids              VARCHAR2(2000),
  user_id                VARCHAR2(200),
  user_name              VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column mc.SMS_BIR_CONFIG.user_group_id
  is '�����û���';
comment on column mc.SMS_BIR_CONFIG.user_group_name
  is ' �����û�������';
comment on column mc.SMS_BIR_CONFIG.do_congratulations
  is '�Ƿ��������ף��';
comment on column mc.SMS_BIR_CONFIG.source_entity_name
  is '����Դ����';
comment on column mc.SMS_BIR_CONFIG.account_name_field
  is '�ͻ������ֶ�';
comment on column mc.SMS_BIR_CONFIG.account_birthday_field
  is '�����ֶ�';
comment on column mc.SMS_BIR_CONFIG.mobile_number_field
  is '�ֻ������ֶ�';
comment on column mc.SMS_BIR_CONFIG.message_template
  is '����ģ��';
comment on column mc.SMS_BIR_CONFIG.send_time
  is '���ŷ���ʱ��';
comment on column mc.SMS_BIR_CONFIG.group_ids
  is 'Ⱥ��ID';
comment on column mc.SMS_BIR_CONFIG.user_id
  is ' �����û�';
comment on column mc.SMS_BIR_CONFIG.user_name
  is ' �����û�����';
alter table mc.SMS_BIR_CONFIG
  add primary key (SMS_BIR_CONFIG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_BIR_RECORD
prompt =============================
prompt
create table mc.SMS_BIR_RECORD
(
  sms_bir_record_id VARCHAR2(200) not null,
  user_group_id     VARCHAR2(200),
  user_group_name   VARCHAR2(200),
  user_id           VARCHAR2(200),
  send_time         DATE,
  status            VARCHAR2(20),
  send_quantity     VARCHAR2(40),
  template          VARCHAR2(200),
  user_name         VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column mc.SMS_BIR_RECORD.user_id
  is '����ʱ��';
comment on column mc.SMS_BIR_RECORD.send_time
  is '���ŷ���ʱ��';
comment on column mc.SMS_BIR_RECORD.status
  is '2:�ѷ���';
comment on column mc.SMS_BIR_RECORD.send_quantity
  is '��������';
comment on column mc.SMS_BIR_RECORD.template
  is '����ģ��';
comment on column mc.SMS_BIR_RECORD.user_name
  is '�û���';
alter table mc.SMS_BIR_RECORD
  add primary key (SMS_BIR_RECORD_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_BIR_RECORD_DETAIL
prompt ====================================
prompt
create table mc.SMS_BIR_RECORD_DETAIL
(
  sms_bir_record_detail_id VARCHAR2(200) not null,
  sms_bir_record_id        VARCHAR2(200),
  user_group_id            VARCHAR2(200),
  user_group_name          VARCHAR2(200),
  user_id                  VARCHAR2(200),
  mobile_number            VARCHAR2(200),
  account_name             VARCHAR2(200),
  message_content          VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_BIR_RECORD_DETAIL
  add primary key (SMS_BIR_RECORD_DETAIL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_CHANNEL_ANALYZE
prompt ==================================
prompt
create table mc.SMS_CHANNEL_ANALYZE
(
  channel_id    NUMBER(5),
  org_id        VARCHAR2(200),
  stat_time     NUMBER(10),
  status        NUMBER(5),
  quantity      NUMBER(10),
  parent_org_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_CHANNEL_RULE_SET
prompt ===================================
prompt
create table mc.SMS_CHANNEL_RULE_SET
(
  rule_set_id       VARCHAR2(20) not null,
  rule_set_name     VARCHAR2(200),
  rule_set_type     VARCHAR2(20),
  dc_file_path      VARCHAR2(200),
  rule_status       VARCHAR2(20),
  user_organization VARCHAR2(50),
  user_org_name     VARCHAR2(20),
  user_id           VARCHAR2(50),
  user_name         VARCHAR2(20),
  descriptions      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_CHANNEL_RULE_SET
  is '����ͨ�������';
comment on column mc.SMS_CHANNEL_RULE_SET.rule_set_id
  is '������';
comment on column mc.SMS_CHANNEL_RULE_SET.rule_set_name
  is '��������';
comment on column mc.SMS_CHANNEL_RULE_SET.rule_set_type
  is '��������, ITEMS:�ֹ�����Ĺ���, DECISIONTABLE:���߱�';
comment on column mc.SMS_CHANNEL_RULE_SET.dc_file_path
  is '���߱���·��';
comment on column mc.SMS_CHANNEL_RULE_SET.rule_status
  is '״̬, -1:�ݸ�״̬, 0:��ѡ, 1:��Ч';
comment on column mc.SMS_CHANNEL_RULE_SET.user_organization
  is '�������';
comment on column mc.SMS_CHANNEL_RULE_SET.user_org_name
  is '��������';
comment on column mc.SMS_CHANNEL_RULE_SET.user_id
  is '�û����';
comment on column mc.SMS_CHANNEL_RULE_SET.user_name
  is '�û�����';
comment on column mc.SMS_CHANNEL_RULE_SET.descriptions
  is '��ע';
alter table mc.SMS_CHANNEL_RULE_SET
  add constraint PK_SMS_CHANNEL_RULE_SET primary key (RULE_SET_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_CHANNEL_RULE_SET_ITEM
prompt ========================================
prompt
create table mc.SMS_CHANNEL_RULE_SET_ITEM
(
  rule_set_id               VARCHAR2(20),
  rule_set_item_id          VARCHAR2(200) not null,
  rule_set_item_name        VARCHAR2(200),
  salience                  NUMBER(7),
  message_class             VARCHAR2(4000),
  sys_id                    VARCHAR2(4000),
  message_type              VARCHAR2(4000),
  org_id                    VARCHAR2(4000),
  user_id                   VARCHAR2(4000),
  mobile_com                NUMBER(4),
  is_wappush                VARCHAR2(10),
  num_scope                 VARCHAR2(200),
  num_region                VARCHAR2(2000),
  mobile                    VARCHAR2(4000),
  is_long_sms               VARCHAR2(10),
  channel_id                VARCHAR2(200),
  msg_type                  VARCHAR2(4000),
  day_start_time            DATE,
  day_end_time              DATE,
  night_start_time          DATE,
  night_end_time            DATE,
  default_channel_id        NUMBER(4),
  default_mobile_channel_id NUMBER(4),
  default_union_channel_id  NUMBER(4),
  default_dx_channel_id     NUMBER(4),
  use_channel_id            NUMBER(4),
  use_long_sms              VARCHAR2(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_CHANNEL_RULE_SET_ITEM
  is '����ͨ���������ϸ��';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.rule_set_id
  is '������';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.rule_set_item_id
  is '������ϸ���';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.rule_set_item_name
  is '��������';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.salience
  is '���ȼ�';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.message_class
  is '��Ϣ����, ���Զ�ѡ';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.sys_id
  is '��Ϣ��Դ, ���Զ�ѡ';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.message_type
  is '��Ϣ����, ���Զ�ѡ';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.org_id
  is '�������, ���Զ�ѡ';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.user_id
  is '�û����, ���Զ�ѡ';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.mobile_com
  is '��Ӫ��, ���Զ�ѡ';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.is_wappush
  is '�Ƿ���WAPPUSH����, true:��, false:����';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.num_scope
  is '�Ŷ�';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.num_region
  is '�ֻ���������';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.mobile
  is '�ֻ����룬���Զ�ѡ';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.is_long_sms
  is '�Ƿ��ǳ����ţ�������ѡ�����ʱ�����ж�';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.channel_id
  is '��ѡͨ��';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.msg_type
  is '��Ϣ����';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.day_start_time
  is '���쿪ʼʱ��';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.day_end_time
  is '�������ʱ��';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.night_start_time
  is 'ҹ�俪ʼʱ��';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.night_end_time
  is 'ҹ�����ʱ��';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.default_channel_id
  is 'ȱʡʹ�õ�ͨ��';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.default_mobile_channel_id
  is 'ȱʡʹ�õ��ƶ�ͨ��';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.default_union_channel_id
  is 'ȱʡʹ�õ���ͨͨ��';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.default_dx_channel_id
  is 'ȱʡʹ�õĵ���ͨ��';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.use_channel_id
  is '����ʹ�õ�ͨ�����';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.use_long_sms
  is '�Ƿ�ʹ�ó����ŷ�ʽ����';
alter table mc.SMS_CHANNEL_RULE_SET_ITEM
  add constraint PK_SMS_CHANNEL_RULE_SET_ITEM primary key (RULE_SET_ITEM_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_ERR_CODE
prompt ===========================
prompt
create table mc.SMS_ERR_CODE
(
  channel_id  NUMBER(4) not null,
  err_code    VARCHAR2(200) not null,
  err_desc    VARCHAR2(200),
  suggestion  VARCHAR2(200),
  description VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_ERR_CODE
  is '����ͨ��״̬�����';
comment on column mc.SMS_ERR_CODE.channel_id
  is 'ͨ�����';
comment on column mc.SMS_ERR_CODE.err_code
  is '������';
comment on column mc.SMS_ERR_CODE.err_desc
  is '˵��';
comment on column mc.SMS_ERR_CODE.suggestion
  is '������';
comment on column mc.SMS_ERR_CODE.description
  is '��ע';
alter table mc.SMS_ERR_CODE
  add constraint PK_SMS_ERR_CODE primary key (CHANNEL_ID, ERR_CODE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_HIS
prompt ======================
prompt
create table mc.SMS_HIS
(
  sms_his_id        VARCHAR2(200) not null,
  send_status       NUMBER(2),
  user_organization VARCHAR2(200),
  channel_id        NUMBER(4),
  mobile_com        NUMBER(2),
  sys_id            VARCHAR2(200),
  message_type      VARCHAR2(200),
  message_class     VARCHAR2(20),
  batch_id          VARCHAR2(200),
  mobile_quantities NUMBER(4),
  send_time         DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_HIS
  is '���Ź鵵��';
comment on column mc.SMS_HIS.sms_his_id
  is 'id';
comment on column mc.SMS_HIS.send_status
  is '����״̬';
comment on column mc.SMS_HIS.user_organization
  is '����';
comment on column mc.SMS_HIS.channel_id
  is 'ͨ��';
comment on column mc.SMS_HIS.mobile_com
  is '��Ӫ��';
comment on column mc.SMS_HIS.sys_id
  is '��Ϣ��Դ';
comment on column mc.SMS_HIS.message_type
  is '��Ϣ����';
comment on column mc.SMS_HIS.message_class
  is '��Ϣ����';
comment on column mc.SMS_HIS.batch_id
  is '���κ�';
comment on column mc.SMS_HIS.mobile_quantities
  is '��������';
comment on column mc.SMS_HIS.send_time
  is '����ʱ��';
alter table mc.SMS_HIS
  add constraint PK_SMS_HIS primary key (SMS_HIS_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_MESSAGE_CLASS
prompt ================================
prompt
create table mc.SMS_MESSAGE_CLASS
(
  sms_message_class_id   VARCHAR2(200) not null,
  sms_message_class_name VARCHAR2(200),
  description            VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_MESSAGE_CLASS
  is '��Ϣ���������ֵ�';
alter table mc.SMS_MESSAGE_CLASS
  add constraint PK_SMS_MESSAGE_CLASS primary key (SMS_MESSAGE_CLASS_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_MESSAGE_TYPE
prompt ===============================
prompt
create table mc.SMS_MESSAGE_TYPE
(
  sms_message_type_id   VARCHAR2(20) not null,
  sms_message_type_name VARCHAR2(2000),
  default_priority      NUMBER(2),
  max_priority          NUMBER(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_MESSAGE_TYPE
  is '��Ϣ���������ֵ�';
comment on column mc.SMS_MESSAGE_TYPE.sms_message_type_id
  is '��Ϣ���ʱ��';
comment on column mc.SMS_MESSAGE_TYPE.sms_message_type_name
  is '��Ϣ��������';
comment on column mc.SMS_MESSAGE_TYPE.default_priority
  is 'ȱʡ�����ȼ�';
comment on column mc.SMS_MESSAGE_TYPE.max_priority
  is '������ȼ�';
alter table mc.SMS_MESSAGE_TYPE
  add constraint PK_SMS_MESSAGE_TYPE primary key (SMS_MESSAGE_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_MO_DISPATCH
prompt ==============================
prompt
create table mc.SMS_MO_DISPATCH
(
  sms_mo_dispatch_id VARCHAR2(200) not null,
  biz_type           VARCHAR2(200),
  biz_entity_id      VARCHAR2(200),
  dispatch_type      VARCHAR2(200),
  dispatch_content   VARCHAR2(20),
  discription        VARCHAR2(40),
  create_time        DATE,
  start_time         DATE,
  end_time           DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_MO_DISPATCH
  is 'ҵ����ŷ��ɱ�';
alter table mc.SMS_MO_DISPATCH
  add constraint PK_SMS_MO_DISPATCH primary key (SMS_MO_DISPATCH_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_MO_DISPATCH_TYPE
prompt ===================================
prompt
create table mc.SMS_MO_DISPATCH_TYPE
(
  biz_type        VARCHAR2(200) not null,
  dispatch_class  VARCHAR2(200),
  dispatch_method VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_MO_DISPATCH_TYPE
  is 'ҵ����ŷ������ͱ�';
alter table mc.SMS_MO_DISPATCH_TYPE
  add constraint PK_SMS_MO_DISPATCH_TYPE primary key (BIZ_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_RECEIVE
prompt ==========================
prompt
create table mc.SMS_RECEIVE
(
  receive_id     VARCHAR2(50) not null,
  mobile_from    VARCHAR2(30),
  receive_msg    VARCHAR2(200),
  sys_time       TIMESTAMP(6) default sysdate,
  sp_num         VARCHAR2(20),
  ext_num        VARCHAR2(20),
  channel_id     NUMBER(2) default 0,
  org_id         VARCHAR2(200),
  user_id        VARCHAR2(200),
  receive_status NUMBER(1) default 0,
  read_time      TIMESTAMP(6),
  msg_id         VARCHAR2(200),
  remark         VARCHAR2(200),
  msg_type       NUMBER(1) default 0,
  msg_key        VARCHAR2(200),
  reply_msg      VARCHAR2(600),
  sys_date_id    NUMBER(19),
  read_status    NUMBER(19),
  sys_ext        VARCHAR2(20),
  sys_id         VARCHAR2(200)
)
partition by range (SYS_TIME)
(
  partition P1 values less than (TIMESTAMP' 2013-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P102 values less than (TIMESTAMP' 2013-05-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P121 values less than (TIMESTAMP' 2013-07-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P42 values less than (TIMESTAMP' 2013-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P89 values less than (TIMESTAMP' 2013-09-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P128 values less than (TIMESTAMP' 2013-10-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P461 values less than (TIMESTAMP' 2013-11-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P801 values less than (TIMESTAMP' 2013-12-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1044 values less than (TIMESTAMP' 2014-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1146 values less than (TIMESTAMP' 2014-02-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1147 values less than (TIMESTAMP' 2014-03-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1183 values less than (TIMESTAMP' 2014-04-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1342 values less than (TIMESTAMP' 2014-05-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1842 values less than (TIMESTAMP' 2014-06-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P2343 values less than (TIMESTAMP' 2014-07-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P2862 values less than (TIMESTAMP' 2014-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P3443 values less than (TIMESTAMP' 2014-09-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P3963 values less than (TIMESTAMP' 2014-10-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P4523 values less than (TIMESTAMP' 2014-11-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P4556 values less than (TIMESTAMP' 2014-12-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P4612 values less than (TIMESTAMP' 2015-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1022 values less than (TIMESTAMP' 2015-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on column mc.SMS_RECEIVE.receive_id
  is '����Id';
comment on column mc.SMS_RECEIVE.mobile_from
  is '���к���';
comment on column mc.SMS_RECEIVE.receive_msg
  is '���ж���';
comment on column mc.SMS_RECEIVE.sys_time
  is '����ʱ��';
comment on column mc.SMS_RECEIVE.sp_num
  is '�ط��ţ����ж���ʱ�����ظ�����������';
comment on column mc.SMS_RECEIVE.ext_num
  is '��չ��';
comment on column mc.SMS_RECEIVE.channel_id
  is '���ж��ŵ�ͨ����� Ĭ��0';
comment on column mc.SMS_RECEIVE.org_id
  is '������������';
comment on column mc.SMS_RECEIVE.user_id
  is '���������û�';
comment on column mc.SMS_RECEIVE.receive_status
  is '����״̬, 0:δ��ҵ��ϵͳ��ȡ, 1:�ѱ�ҵ��ϵͳ��ȡ, ҵ��ϵͳ��ȡ���ж��ź�Ӧ�����ֶ���Ϊ1 Ĭ��0';
comment on column mc.SMS_RECEIVE.read_time
  is 'ҵ��ϵͳ��ȡ���ŵ�ʱ��';
comment on column mc.SMS_RECEIVE.msg_id
  is '���ɶ��ŵ�ҵ��ϵͳ�Ķ��ű��';
comment on column mc.SMS_RECEIVE.remark
  is '�����ֶ�';
comment on column mc.SMS_RECEIVE.msg_type
  is '���ж��ŵ����ͣ�0:��ѯ���ţ�1���㲥����,2�����ŵ��� Ĭ��ֵ0';
comment on column mc.SMS_RECEIVE.reply_msg
  is '�ظ�����';

prompt
prompt Creating table SMS_RECEIVE_CLIENT
prompt =================================
prompt
create table mc.SMS_RECEIVE_CLIENT
(
  sms_receive_client_id VARCHAR2(100) not null,
  user_name             VARCHAR2(100),
  pass_word             VARCHAR2(100),
  receive_id            VARCHAR2(100),
  sp                    VARCHAR2(100),
  mobile                VARCHAR2(100),
  motime                VARCHAR2(100),
  msg                   VARCHAR2(2000),
  sys_time              DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SMS_RECEIVE_CLIENT
  add primary key (SMS_RECEIVE_CLIENT_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_RECEIVE_HIS
prompt ==============================
prompt
create table mc.SMS_RECEIVE_HIS
(
  receive_id     NUMBER(32) not null,
  mobile_from    VARCHAR2(30),
  receive_msg    VARCHAR2(200),
  sys_time       DATE,
  sys_date_id    NUMBER(8),
  sp_num         VARCHAR2(20),
  sys_ext        VARCHAR2(20),
  ext_num        VARCHAR2(20),
  channel_id     NUMBER(2),
  org_id         VARCHAR2(200),
  receive_status NUMBER(1),
  read_time      DATE,
  sys_id         VARCHAR2(200),
  msg_id         VARCHAR2(200),
  remark         VARCHAR2(200),
  msg_key        VARCHAR2(200),
  reply_msg      VARCHAR2(600)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_RECEIVE_HIS
  add constraint PK_SMS_RECEIVE_HIS primary key (RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_RECEIVEHIS_MOBILE on mc.SMS_RECEIVE_HIS (MOBILE_FROM)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_RECEIVEHIS_RECEIVETIME on mc.SMS_RECEIVE_HIS (SYS_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_RECEIVE_OLD
prompt ==============================
prompt
create table mc.SMS_RECEIVE_OLD
(
  receive_id     NUMBER(32) not null,
  mobile_from    VARCHAR2(30),
  receive_msg    VARCHAR2(200),
  sys_time       DATE default sysdate,
  sys_date_id    NUMBER(8),
  sp_num         VARCHAR2(20),
  sys_ext        VARCHAR2(20),
  ext_num        VARCHAR2(20),
  channel_id     NUMBER(2),
  org_id         VARCHAR2(200),
  receive_status NUMBER(1) default 0,
  read_time      DATE,
  sys_id         VARCHAR2(200),
  msg_id         VARCHAR2(200),
  remark         VARCHAR2(200),
  msg_key        VARCHAR2(200) default 0,
  reply_msg      VARCHAR2(600)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_RECEIVE_OLD
  is '���ձ�';
comment on column mc.SMS_RECEIVE_OLD.receive_id
  is '���ж��ű��, UUID';
comment on column mc.SMS_RECEIVE_OLD.mobile_from
  is '���ж��ŵ��ֻ���';
comment on column mc.SMS_RECEIVE_OLD.receive_msg
  is '���ж�������';
comment on column mc.SMS_RECEIVE_OLD.sys_time
  is '���ж���ʱ��';
comment on column mc.SMS_RECEIVE_OLD.sys_date_id
  is '���ж�������(��ʽYYYYMMDD)';
comment on column mc.SMS_RECEIVE_OLD.sp_num
  is '�ط��ţ����ж���ʱ�����ظ�����������';
comment on column mc.SMS_RECEIVE_OLD.sys_ext
  is '��Ϣ��Դ����ҵ��ϵͳ����Ӧ����չ�ţ��������ط���SP_NUMΪ95551121234����SYS_EXT����Ϊ12[������ҵ��ϵͳ��Ӧ��չ�ű��ֵ䣩�Ƿ��ƶ�Ϊ2λ����ϵͳ��Ӧ�Ļ�����η�������ҵ��ϵͳ]����ҵ��ϵͳ���ݡ�ҵ��ϵͳ��Ӧ��չ�š���ƥ������������Ϣ���ڱ�ϵͳ�Ķ���';
comment on column mc.SMS_RECEIVE_OLD.ext_num
  is 'ҵ����չ�룬��Ӧҵ��ϵͳ��ҵ���ţ��������ط���SP_NUMΪ95551121234����BIZ_EXT����Ϊ1234��ƥ�����б�sms_send�е�EXT_NUM[��������ͳһ]�ֶΣ�';
comment on column mc.SMS_RECEIVE_OLD.channel_id
  is '���ж��ŵ�ͨ�����';
comment on column mc.SMS_RECEIVE_OLD.org_id
  is '���ж�����������';
comment on column mc.SMS_RECEIVE_OLD.receive_status
  is '����״̬, 0:δ��ҵ��ϵͳ��ȡ, 1:�ѱ�ҵ��ϵͳ��ȡ, ҵ��ϵͳ��ȡ���ж��ź�Ӧ�����ֶ���Ϊ1,�����ظ���ȡ';
comment on column mc.SMS_RECEIVE_OLD.read_time
  is 'ҵ��ϵͳ��ȡ���ŵ�ʱ��';
comment on column mc.SMS_RECEIVE_OLD.sys_id
  is 'ҵ��ϵͳ�ı��, ���ڱ�ʶ���������ĸ�ҵ��ϵͳ,����ͻ���ϵ����ϵͳΪCRM';
comment on column mc.SMS_RECEIVE_OLD.msg_id
  is '���ɶ��ŵ�ҵ��ϵͳ�Ķ��ű��';
comment on column mc.SMS_RECEIVE_OLD.remark
  is '�����ֶΣ�����';
comment on column mc.SMS_RECEIVE_OLD.msg_key
  is '���ж��ŵ����ͣ�0:��ѯ���ţ�1���㲥����,2�����ŵ���';
comment on column mc.SMS_RECEIVE_OLD.reply_msg
  is '��ѯ���ŵĻظ���Ϣ';
alter table mc.SMS_RECEIVE_OLD
  add constraint PK_SMS_RECEIVE primary key (RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSRECEIVE_MOBILE on mc.SMS_RECEIVE_OLD (MOBILE_FROM)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSRECEIVE_RECEIVETIME on mc.SMS_RECEIVE_OLD (SYS_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_REPORT
prompt =========================
prompt
create table mc.SMS_REPORT
(
  sequence               VARCHAR2(200) not null,
  channel_id             NUMBER(4),
  gw_status              VARCHAR2(50),
  gw_status_desc         VARCHAR2(100),
  sms_status             NUMBER(2),
  submit_time            TIMESTAMP(6),
  report_time            TIMESTAMP(6) default systimestamp,
  sys_time               TIMESTAMP(6) default systimestamp,
  send_id                VARCHAR2(200),
  originalsms_sendid     VARCHAR2(200),
  originalsms_totalpages NUMBER(1),
  current_pageno         NUMBER(1),
  batch_id               VARCHAR2(200),
  msg_id                 VARCHAR2(200),
  sys_id                 VARCHAR2(50),
  mobile_to              VARCHAR2(50),
  status                 NUMBER(1) default 0,
  fetch_status           NUMBER(1) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_REPORT
  is '����״̬����';
comment on column mc.SMS_REPORT.sequence
  is '�����ڶ������صı��';
comment on column mc.SMS_REPORT.channel_id
  is 'ͨ�����';
comment on column mc.SMS_REPORT.gw_status
  is '���ص�״̬����';
comment on column mc.SMS_REPORT.gw_status_desc
  is '���ص�״̬��������';
comment on column mc.SMS_REPORT.sms_status
  is '��״̬�����Ӧ����ƽ̨��״̬,1:���ύ, 5:�ͻ��յ�����, 6:�ͻ�δ�յ�����';
comment on column mc.SMS_REPORT.submit_time
  is '�����ύ���������ص�ʱ��';
comment on column mc.SMS_REPORT.report_time
  is '�ͻ��յ�����ʱ��';
comment on column mc.SMS_REPORT.sys_time
  is '״̬�������ʱ��';
comment on column mc.SMS_REPORT.send_id
  is '״̬�����Ӧ�Ķ��ŵı��';
comment on column mc.SMS_REPORT.originalsms_sendid
  is 'ԭʼ���ű�ţ���������Ϊ�ɳ����Ų�ֳɵĶ̶���ʱ, �������ݴ˱�Ų�ѯ��ԭʼ����';
comment on column mc.SMS_REPORT.originalsms_totalpages
  is '�����̶������������Ź��ж��ŵ�ҳ��';
comment on column mc.SMS_REPORT.current_pageno
  is '��ǰ���ŵ�ҳ��,�������ŵĵڼ����̶���';
comment on column mc.SMS_REPORT.batch_id
  is '��������,���ڱ�ʶͬһ������';
comment on column mc.SMS_REPORT.msg_id
  is '��Ӧҵ��ϵͳ�Ķ��ű��';
comment on column mc.SMS_REPORT.sys_id
  is '��Ϣ��Դ, ���Ķ��������ĸ�ҵ��ϵͳ';
comment on column mc.SMS_REPORT.mobile_to
  is '��Ӧ�ֻ���';
comment on column mc.SMS_REPORT.status
  is '״̬����״̬��0��δ�ɹ����¶���, 1:�ɹ����¶���״̬';
comment on column mc.SMS_REPORT.fetch_status
  is 'ҵ��ϵͳ��ȡ״̬�����״̬��0��δ��ȡ, 1:�Ѷ�ȡ';
alter table mc.SMS_REPORT
  add constraint PK_SMS_REPORT primary key (SEQUENCE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_REPORT_B on mc.SMS_REPORT (BATCH_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_REPORT_M on mc.SMS_REPORT (MSG_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_REPORT_MT on mc.SMS_REPORT (MOBILE_TO)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_REPORT_S on mc.SMS_REPORT (SYS_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_REPORT_CLIENT
prompt ================================
prompt
create table mc.SMS_REPORT_CLIENT
(
  sms_report_client_id VARCHAR2(100) not null,
  user_name            VARCHAR2(100),
  pass_word            VARCHAR2(100),
  msg_id               VARCHAR2(100),
  mobile               VARCHAR2(100),
  status               VARCHAR2(100),
  status_desc          VARCHAR2(100),
  report_time          VARCHAR2(100),
  sys_time             DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SMS_REPORT_CLIENT
  add primary key (SMS_REPORT_CLIENT_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_REPORT_HIS
prompt =============================
prompt
create table mc.SMS_REPORT_HIS
(
  sms_report_id          VARCHAR2(40) not null,
  channel_id             NUMBER(4),
  submit_time            TIMESTAMP(6),
  done_time              TIMESTAMP(6),
  report_time            TIMESTAMP(6),
  status                 NUMBER(1),
  status_code            VARCHAR2(40),
  status_code_desc       VARCHAR2(200),
  mobile                 VARCHAR2(20),
  gw_msg_id              VARCHAR2(100),
  smsreport_id           VARCHAR2(200),
  sequence               VARCHAR2(200),
  gw_status              VARCHAR2(50),
  gw_status_desc         VARCHAR2(100),
  sms_status             NUMBER(2),
  sys_time               TIMESTAMP(6),
  send_id                VARCHAR2(200),
  originalsms_sendid     VARCHAR2(200),
  originalsms_totalpages NUMBER(1),
  current_pageno         NUMBER(1),
  batch_id               VARCHAR2(200),
  msg_id                 VARCHAR2(200),
  sys_id                 VARCHAR2(50),
  mobile_to              VARCHAR2(50),
  fetch_status           NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SMS_REPORT_HIS
  add constraint PK_SMS_REPORT_HIS primary key (SMS_REPORT_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SMS_REPORT_HIS_GWMSGID on mc.SMS_REPORT_HIS (GW_MSG_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_SEND
prompt =======================
prompt
create table mc.SMS_SEND
(
  send_id                NUMBER(32) not null,
  mobile_to              VARCHAR2(20),
  send_msg               VARCHAR2(600),
  org_id                 VARCHAR2(50) default '0000',
  sys_id                 VARCHAR2(10),
  prior_id               NUMBER(1) default 8,
  pre_send_time          DATE default sysdate,
  ext_num                VARCHAR2(20),
  user_id                VARCHAR2(40),
  cust_id                VARCHAR2(40),
  batch_id               VARCHAR2(40),
  msg_id                 VARCHAR2(80),
  message_class          VARCHAR2(20) default '00',
  message_type           VARCHAR2(20) default '00',
  wappush_url            VARCHAR2(200),
  send_deadline          TIMESTAMP(6),
  send_status            NUMBER(2) default -2,
  sys_time               DATE default sysdate,
  sys_date_id            NUMBER(18),
  send_time              DATE default sysdate,
  send_date_id           NUMBER(18),
  send_weekdate          CHAR(1) default 0,
  com_rtn_time           DATE,
  report_time            DATE,
  channel_id             NUMBER(4) default 0,
  mobile_com             NUMBER(2),
  sequence               VARCHAR2(40),
  mobile_quantities      NUMBER(4) default 1,
  resend_times           NUMBER(1) default 0,
  signature              VARCHAR2(40),
  msg_type               VARCHAR2(50),
  err_id                 VARCHAR2(20),
  err_msg                VARCHAR2(100),
  is_longsms             NUMBER(1) default 0,
  is_original_sms        NUMBER(1) default 0,
  originalsms_sendid     VARCHAR2(200),
  current_pageno         NUMBER(1),
  originalsms_totalpages NUMBER(1),
  longsms_tag            NUMBER(4),
  longsms_splited        NUMBER(1) default 0,
  remark                 VARCHAR2(500),
  sender_id              VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SEND
  is '���ж�����Ϣ��';
comment on column mc.SMS_SEND.send_id
  is '���ж�����ţ����ж��ŵ�Ψһ��ʶ';
comment on column mc.SMS_SEND.mobile_to
  is 'Ŀ���ֻ���(һ���ֻ����룩';
comment on column mc.SMS_SEND.send_msg
  is '��������,�Ϊ300��';
comment on column mc.SMS_SEND.org_id
  is '�������';
comment on column mc.SMS_SEND.sys_id
  is 'ҵ��ϵͳ�ı��, ���ڱ�ʶ���������ĸ�ҵ��ϵͳ�ı�� ������д������ERR_ID�ֶ���ʾ1010����)';
comment on column mc.SMS_SEND.prior_id
  is '���ȼ�';
comment on column mc.SMS_SEND.pre_send_time
  is 'Ԥ�Ʒ���ʱ��';
comment on column mc.SMS_SEND.ext_num
  is '��չ����';
comment on column mc.SMS_SEND.user_id
  is '�û����';
comment on column mc.SMS_SEND.cust_id
  is '��д���ŵĿͻ����, �ͻ���д����ʱ��¼';
comment on column mc.SMS_SEND.batch_id
  is '��������,���ڱ�ʶͬһ������';
comment on column mc.SMS_SEND.msg_id
  is '���ɶ��ŵ�ҵ��ϵͳ�Ķ��ű��';
comment on column mc.SMS_SEND.message_class
  is '��Ϣ����ı��';
comment on column mc.SMS_SEND.message_type
  is '��Ϣ����';
comment on column mc.SMS_SEND.wappush_url
  is 'WAPPUSH����, ���ֶ���дֵʱ�����ö���ΪWAPPUSH����, ϵͳ����WAPPUSH��ʽ���͸ö���';
comment on column mc.SMS_SEND.send_deadline
  is '���͵Ľ�ֹʱ��, ������ʱ�����ڸ�ʱ��ʱ, ϵͳ��ȡ���ö��ŵķ���';
comment on column mc.SMS_SEND.send_status
  is '����״̬,-2:�����δ��ʼ����, 0:δ����, 1:�ѷ���, 2:������, 5:���ͳɹ�, 6:����ʧ�ܣ���ֵ��Ӧ��ʧ��ԭ������鿴ERR_ID��)';
comment on column mc.SMS_SEND.sys_time
  is '�������ʱ��';
comment on column mc.SMS_SEND.sys_date_id
  is '����������ڣ���ʽYYYYMMDD��';
comment on column mc.SMS_SEND.send_time
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column mc.SMS_SEND.send_date_id
  is 'ƽ̨���͸ö��ŵ����ڣ��鵵���Դ���Ϊ��������ʽYYYYMMDD��';
comment on column mc.SMS_SEND.send_weekdate
  is 'ƽ̨���͸ö��ŵ�ʱ��Ϊ�ܼ�, 0:δ����, 1:����, 2:��һ, 3:�ܶ�, 4:����, 5:����, 6:����, 7:����';
comment on column mc.SMS_SEND.com_rtn_time
  is '�������ط����ύӦ���ʱ��';
comment on column mc.SMS_SEND.report_time
  is '״̬����ʱ��';
comment on column mc.SMS_SEND.channel_id
  is 'ͨ����� ϵͳ����ʧ�ܣ�������ں���������Ϣ�а������дʣ�����д0��';
comment on column mc.SMS_SEND.mobile_com
  is '��Ӫ�̱��, 1:�ƶ�,2:��ͨ, 3:���� 0:�������';
comment on column mc.SMS_SEND.sequence
  is '�������صĶ��ű��, �������ط���״̬����ʱ����ƥ��ԭʼ����';
comment on column mc.SMS_SEND.mobile_quantities
  is '�������ŵĶ�������';
comment on column mc.SMS_SEND.resend_times
  is '���ŵ��ط�����';
comment on column mc.SMS_SEND.signature
  is '����ǩ��';
comment on column mc.SMS_SEND.msg_type
  is '��Ϣ����,���ڱ�ʶ���ŵ����ɷ�ʽ������Դ';
comment on column mc.SMS_SEND.err_id
  is '������룬������Ϣƽ̨�������Ͷ������ش������ ���Ŵ������ 1007������������ 1008�����Ű���Υ���� 1009�������ֻ��� 1010��SYS_ID ��д����';
comment on column mc.SMS_SEND.err_msg
  is '��������˵����Ϣ';
comment on column mc.SMS_SEND.is_longsms
  is '�ö����Ƿ��ǳ�����,0:���ǳ�����,1:�ǳ�����';
comment on column mc.SMS_SEND.is_original_sms
  is '�ö����Ƿ���ԭʼ����,��ԭʼ����ָ�����ŷ���ʱ��ֳ��Ķ���,0:��ԭʼ����, 1:����ԭʼ����';
comment on column mc.SMS_SEND.originalsms_sendid
  is 'ԭʼ���ű�ţ���������Ϊ�ɳ����Ų�ֳɵĶ̶���ʱ, �������ݴ˱�Ų�ѯ��ԭʼ����';
comment on column mc.SMS_SEND.current_pageno
  is '��ǰ���ŵ�ҳ��,�������ŵĵڼ����̶���';
comment on column mc.SMS_SEND.originalsms_totalpages
  is '�����̶������������Ź��ж��ŵ�ҳ��';
comment on column mc.SMS_SEND.longsms_tag
  is '�����Ŷ���ʶ����ͬһ�������ŵĶ̶��Ÿñ�ʶ��ͬ';
comment on column mc.SMS_SEND.longsms_splited
  is '�������Ƿ񱻲�֣�0û�б���ֻ�������ͨ���ţ�1�Ѿ�����֡�����ֵĶ��Ų�ѯͳ��ʱ��Ӧ����������Ĭ��0';
comment on column mc.SMS_SEND.remark
  is '��ע��Ϣ�������ֶΣ���չʱʹ��';
comment on column mc.SMS_SEND.sender_id
  is '������ID�����ݿ�ӿ�ʱ���������ݿ��ʺ�';
alter table mc.SMS_SEND
  add constraint PK_SMS_SEND primary key (SEND_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_BATCH_ID on mc.SMS_SEND (BATCH_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_CHANNEL on mc.SMS_SEND (CHANNEL_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_MOBILE on mc.SMS_SEND (MOBILE_TO)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_PRIOR_ID on mc.SMS_SEND (PRIOR_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SEND_DATE on mc.SMS_SEND (SEND_WEEKDATE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SEND_STATUS on mc.SMS_SEND (SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SEND_TIME on mc.SMS_SEND (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SEQUENCE on mc.SMS_SEND (SEQUENCE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_STATS_CHAN on mc.SMS_SEND (CHANNEL_ID, SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SYSDATE_MSGID on mc.SMS_SEND (SYS_DATE_ID, MSG_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SYS_TIME on mc.SMS_SEND (SYS_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SEND_ANALYZE
prompt ===============================
prompt
create table mc.SMS_SEND_ANALYZE
(
  org_id        VARCHAR2(200),
  user_id       VARCHAR2(200),
  stat_time     NUMBER(10),
  status        NUMBER(5),
  quantity      NUMBER(10),
  parent_org_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_SEND_HIS
prompt ===========================
prompt
create table mc.SMS_SEND_HIS
(
  send_id                NUMBER(32) not null,
  mobile_to              VARCHAR2(20),
  send_msg               VARCHAR2(600),
  org_id                 VARCHAR2(50) default '0000',
  sys_id                 VARCHAR2(10),
  prior_id               NUMBER(1) default 8,
  pre_send_time          DATE default sysdate,
  ext_num                VARCHAR2(20),
  user_id                VARCHAR2(40),
  cust_id                VARCHAR2(40),
  batch_id               VARCHAR2(40),
  msg_id                 VARCHAR2(80),
  message_class          VARCHAR2(20) default '00',
  message_type           VARCHAR2(20) default '00',
  wappush_url            VARCHAR2(200),
  send_deadline          TIMESTAMP(6),
  send_status            NUMBER(2) default -2,
  sys_time               DATE default sysdate,
  sys_date_id            NUMBER(18),
  send_time              DATE default sysdate,
  send_date_id           NUMBER(18),
  send_weekdate          CHAR(1) default 0,
  com_rtn_time           DATE,
  report_time            DATE,
  channel_id             NUMBER(4) default 0,
  mobile_com             NUMBER(2),
  sequence               VARCHAR2(40),
  mobile_quantities      NUMBER(4) default 1,
  resend_times           NUMBER(1) default 0,
  signature              VARCHAR2(40),
  msg_type               VARCHAR2(50),
  err_id                 VARCHAR2(20),
  err_msg                VARCHAR2(100),
  is_longsms             NUMBER(1) default 0,
  is_original_sms        NUMBER(1) default 0,
  originalsms_sendid     VARCHAR2(200),
  current_pageno         NUMBER(1),
  originalsms_totalpages NUMBER(1),
  longsms_tag            NUMBER(5),
  longsms_splited        NUMBER(1) default 0,
  remark                 VARCHAR2(500),
  sender_id              VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SEND_HIS
  is '���ж�����Ϣ��';
comment on column mc.SMS_SEND_HIS.send_id
  is '���ж�����ţ����ж��ŵ�Ψһ��ʶ';
comment on column mc.SMS_SEND_HIS.mobile_to
  is 'Ŀ���ֻ���(һ���ֻ����룩';
comment on column mc.SMS_SEND_HIS.send_msg
  is '��������,�Ϊ300��';
comment on column mc.SMS_SEND_HIS.org_id
  is '�������';
comment on column mc.SMS_SEND_HIS.sys_id
  is 'ҵ��ϵͳ�ı��, ���ڱ�ʶ���������ĸ�ҵ��ϵͳ�ı�� ������д������ERR_ID�ֶ���ʾ1010����)';
comment on column mc.SMS_SEND_HIS.prior_id
  is '���ȼ�';
comment on column mc.SMS_SEND_HIS.pre_send_time
  is 'Ԥ�Ʒ���ʱ��';
comment on column mc.SMS_SEND_HIS.ext_num
  is '��չ����';
comment on column mc.SMS_SEND_HIS.user_id
  is '�û����';
comment on column mc.SMS_SEND_HIS.cust_id
  is '��д���ŵĿͻ����, �ͻ���д����ʱ��¼';
comment on column mc.SMS_SEND_HIS.batch_id
  is '��������,���ڱ�ʶͬһ������';
comment on column mc.SMS_SEND_HIS.msg_id
  is '���ɶ��ŵ�ҵ��ϵͳ�Ķ��ű��';
comment on column mc.SMS_SEND_HIS.message_class
  is '��Ϣ����ı��';
comment on column mc.SMS_SEND_HIS.message_type
  is '��Ϣ����';
comment on column mc.SMS_SEND_HIS.wappush_url
  is 'WAPPUSH����, ���ֶ���дֵʱ�����ö���ΪWAPPUSH����, ϵͳ����WAPPUSH��ʽ���͸ö���';
comment on column mc.SMS_SEND_HIS.send_deadline
  is '���͵Ľ�ֹʱ��, ������ʱ�����ڸ�ʱ��ʱ, ϵͳ��ȡ���ö��ŵķ���';
comment on column mc.SMS_SEND_HIS.send_status
  is '����״̬,-2:�����δ��ʼ����, 0:δ����, 1:�ѷ���, 2:������, 5:���ͳɹ�, 6:����ʧ�ܣ���ֵ��Ӧ��ʧ��ԭ������鿴ERR_ID��)';
comment on column mc.SMS_SEND_HIS.sys_time
  is '�������ʱ��';
comment on column mc.SMS_SEND_HIS.sys_date_id
  is '����������ڣ���ʽYYYYMMDD��';
comment on column mc.SMS_SEND_HIS.send_time
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column mc.SMS_SEND_HIS.send_date_id
  is 'ƽ̨���͸ö��ŵ����ڣ��鵵���Դ���Ϊ��������ʽYYYYMMDD��';
comment on column mc.SMS_SEND_HIS.send_weekdate
  is 'ƽ̨���͸ö��ŵ�ʱ��Ϊ�ܼ�, 0:δ����, 1:����, 2:��һ, 3:�ܶ�, 4:����, 5:����, 6:����, 7:����';
comment on column mc.SMS_SEND_HIS.com_rtn_time
  is '�������ط����ύӦ���ʱ��';
comment on column mc.SMS_SEND_HIS.report_time
  is '״̬����ʱ��';
comment on column mc.SMS_SEND_HIS.channel_id
  is 'ͨ����� ϵͳ����ʧ�ܣ�������ں���������Ϣ�а������дʣ�����д0��';
comment on column mc.SMS_SEND_HIS.mobile_com
  is '��Ӫ�̱��, 1:�ƶ�,2:��ͨ, 3:���� 0:�������';
comment on column mc.SMS_SEND_HIS.sequence
  is '�������صĶ��ű��, �������ط���״̬����ʱ����ƥ��ԭʼ����';
comment on column mc.SMS_SEND_HIS.mobile_quantities
  is '�������ŵĶ�������';
comment on column mc.SMS_SEND_HIS.resend_times
  is '���ŵ��ط�����';
comment on column mc.SMS_SEND_HIS.signature
  is '����ǩ��';
comment on column mc.SMS_SEND_HIS.msg_type
  is '��Ϣ����,���ڱ�ʶ���ŵ����ɷ�ʽ������Դ';
comment on column mc.SMS_SEND_HIS.err_id
  is '������룬������Ϣƽ̨�������Ͷ������ش������ ���Ŵ������ 1007������������ 1008�����Ű���Υ���� 1009�������ֻ��� 1010��SYS_ID ��д����';
comment on column mc.SMS_SEND_HIS.err_msg
  is '��������˵����Ϣ';
comment on column mc.SMS_SEND_HIS.is_longsms
  is '�ö����Ƿ��ǳ�����,0:���ǳ�����,1:�ǳ�����';
comment on column mc.SMS_SEND_HIS.is_original_sms
  is '�ö����Ƿ���ԭʼ����,��ԭʼ����ָ�����ŷ���ʱ��ֳ��Ķ���,0:��ԭʼ����, 1:����ԭʼ����';
comment on column mc.SMS_SEND_HIS.originalsms_sendid
  is 'ԭʼ���ű�ţ���������Ϊ�ɳ����Ų�ֳɵĶ̶���ʱ, �������ݴ˱�Ų�ѯ��ԭʼ����';
comment on column mc.SMS_SEND_HIS.current_pageno
  is '��ǰ���ŵ�ҳ��,�������ŵĵڼ����̶���';
comment on column mc.SMS_SEND_HIS.originalsms_totalpages
  is '�����̶������������Ź��ж��ŵ�ҳ��';
comment on column mc.SMS_SEND_HIS.longsms_tag
  is '�����Ŷ���ʶ����ͬһ�������ŵĶ̶��Ÿñ�ʶ��ͬ';
comment on column mc.SMS_SEND_HIS.longsms_splited
  is '�������Ƿ񱻲�֣�0û�б���ֻ�������ͨ���ţ�1�Ѿ�����֡�����ֵĶ��Ų�ѯͳ��ʱ��Ӧ����������Ĭ��0';
comment on column mc.SMS_SEND_HIS.remark
  is '��ע��Ϣ�������ֶΣ���չʱʹ��';
comment on column mc.SMS_SEND_HIS.sender_id
  is '������ID�����ݿ�ӿ�ʱ���������ݿ��ʺ�';
alter table mc.SMS_SEND_HIS
  add constraint PK_SMS_SEND_HIS primary key (SEND_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_BATCH_ID on mc.SMS_SEND_HIS (BATCH_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_CHANNEL on mc.SMS_SEND_HIS (CHANNEL_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_MOBILE on mc.SMS_SEND_HIS (MOBILE_TO)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_PRIOR_ID on mc.SMS_SEND_HIS (PRIOR_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_SENDDATE on mc.SMS_SEND_HIS (SEND_WEEKDATE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_SENDTIME on mc.SMS_SEND_HIS (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_SEQUENCE on mc.SMS_SEND_HIS (SEQUENCE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_STATS_CHAN on mc.SMS_SEND_HIS (CHANNEL_ID, SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_STATUS on mc.SMS_SEND_HIS (SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_SYSTIME on mc.SMS_SEND_HIS (SYS_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SEND_PAPER
prompt =============================
prompt
create table mc.SMS_SEND_PAPER
(
  sms_send_paper_id VARCHAR2(100) not null,
  status            NUMBER(1),
  prior_id          NUMBER(1),
  is_check          NUMBER(1),
  subject           VARCHAR2(1000),
  content           CLOB,
  mobiles           CLOB,
  groups            CLOB,
  file_url          VARCHAR2(200),
  file_name         VARCHAR2(200),
  sys_time          DATE default sysdate,
  pre_send_time     DATE,
  send_time         DATE,
  check_time        DATE,
  creator           VARCHAR2(100),
  creator_name      VARCHAR2(100),
  creator_org       VARCHAR2(100),
  creator_org_name  VARCHAR2(100),
  auditor           VARCHAR2(100),
  auditor_name      VARCHAR2(100),
  auditor_org       VARCHAR2(100),
  auditor_org_name  VARCHAR2(100),
  batch_id          VARCHAR2(100),
  send_type         VARCHAR2(50),
  msg_type          VARCHAR2(50),
  product_id        VARCHAR2(100),
  product_name      VARCHAR2(100),
  product_item_id   VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SEND_PAPER
  is '������ͨ������ʷ��¼��';
comment on column mc.SMS_SEND_PAPER.sms_send_paper_id
  is 'ϵͳ���';
comment on column mc.SMS_SEND_PAPER.status
  is '�Ƿ����ã�0���ύ��ˣ�δ��ˣ�,1���ͨ����3�������ʧ�ܣ�5���ŷ��ͳɹ���6���ŷ���ʧ��';
comment on column mc.SMS_SEND_PAPER.prior_id
  is '���ȼ�';
comment on column mc.SMS_SEND_PAPER.is_check
  is '�Ƿ���Ҫ���  0Ϊ����Ҫ��1Ϊ��Ҫ';
comment on column mc.SMS_SEND_PAPER.subject
  is '����ǲ��ŵĻ����������ݲ�Ϊ��';
comment on column mc.SMS_SEND_PAPER.content
  is '����';
comment on column mc.SMS_SEND_PAPER.mobiles
  is '�ֻ�����';
comment on column mc.SMS_SEND_PAPER.groups
  is '�ͻ�Ⱥ��';
comment on column mc.SMS_SEND_PAPER.file_url
  is '�ļ���ַ';
comment on column mc.SMS_SEND_PAPER.file_name
  is '�ļ�����';
comment on column mc.SMS_SEND_PAPER.sys_time
  is '����ʱ��';
comment on column mc.SMS_SEND_PAPER.pre_send_time
  is 'Ԥ�Ʒ���ʱ��';
comment on column mc.SMS_SEND_PAPER.send_time
  is '����ʱ��';
comment on column mc.SMS_SEND_PAPER.check_time
  is '�ύ���ʱ��';
comment on column mc.SMS_SEND_PAPER.creator
  is '������';
comment on column mc.SMS_SEND_PAPER.creator_name
  is '������';
comment on column mc.SMS_SEND_PAPER.creator_org
  is '�����߻���';
comment on column mc.SMS_SEND_PAPER.creator_org_name
  is '�����߻���';
comment on column mc.SMS_SEND_PAPER.auditor
  is '�����';
comment on column mc.SMS_SEND_PAPER.auditor_name
  is '�����';
comment on column mc.SMS_SEND_PAPER.auditor_org
  is '����߻���';
comment on column mc.SMS_SEND_PAPER.auditor_org_name
  is '����߻���';
comment on column mc.SMS_SEND_PAPER.batch_id
  is '���ŵ����κţ��������͵�ʱ��ʹ��';
comment on column mc.SMS_SEND_PAPER.send_type
  is '�������ͣ�COMMON����ͨ���͡�BATCH���������͡�TEMPLATE��ģ�巢�͡�PRODUCT����Ŀ����';
comment on column mc.SMS_SEND_PAPER.msg_type
  is '��Ϣ���ͣ�SMS�����š�MMS������';
comment on column mc.SMS_SEND_PAPER.product_id
  is '��Ŀ���';
comment on column mc.SMS_SEND_PAPER.product_name
  is '��Ŀ����';
comment on column mc.SMS_SEND_PAPER.product_item_id
  is '��Ŀ������ʷ��¼�ı��';
alter table mc.SMS_SEND_PAPER
  add constraint PK_SMS_SEND_PAPER primary key (SMS_SEND_PAPER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SPNUMBER
prompt ===========================
prompt
create table mc.SMS_SPNUMBER
(
  sms_spnumber_id   VARCHAR2(20) not null,
  spnumber          VARCHAR2(20),
  status            NUMBER(1),
  spnumber_type     VARCHAR2(100),
  description       VARCHAR2(200),
  sort_index        VARCHAR2(20),
  organization_id   VARCHAR2(50),
  organization_name VARCHAR2(200),
  user_id           VARCHAR2(50),
  user_name         VARCHAR2(200),
  create_time       DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_SPNUMBER
  is '�����ط��ű�';
comment on column mc.SMS_SPNUMBER.sms_spnumber_id
  is '�ط��ű��';
comment on column mc.SMS_SPNUMBER.spnumber
  is '�ط���';
comment on column mc.SMS_SPNUMBER.status
  is '״̬, 0:ʧЧ, 1:��Ч';
comment on column mc.SMS_SPNUMBER.spnumber_type
  is '����, PREFIX:ǰ׺, REGEXP:������ʽ';
comment on column mc.SMS_SPNUMBER.description
  is '��ע';
comment on column mc.SMS_SPNUMBER.sort_index
  is '������';
comment on column mc.SMS_SPNUMBER.organization_id
  is '�������';
comment on column mc.SMS_SPNUMBER.organization_name
  is '��������';
comment on column mc.SMS_SPNUMBER.user_id
  is '�û����';
comment on column mc.SMS_SPNUMBER.user_name
  is '�û�����';
comment on column mc.SMS_SPNUMBER.create_time
  is '����ʱ��';
alter table mc.SMS_SPNUMBER
  add constraint PK_SMS_SPNUMBER primary key (SMS_SPNUMBER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.SPNUMBER_SORTIDX on mc.SMS_SPNUMBER (SORT_INDEX)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_STATICS_CHANNEL
prompt ==================================
prompt
create table mc.SMS_STATICS_CHANNEL
(
  sms_statics_channel_id VARCHAR2(200) not null,
  send_time              DATE,
  channel_id             NUMBER(4),
  mobile_com             NUMBER(2),
  send_status            NUMBER(2),
  mobile_quantities      NUMBER(10),
  sys_time               TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_STATICS_CHANNEL
  add constraint PK_SMS_STATICS_CHANNEL primary key (SMS_STATICS_CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_STCSCH_TIME on mc.SMS_STATICS_CHANNEL (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_STATICS_DATE
prompt ===============================
prompt
create table mc.SMS_STATICS_DATE
(
  sms_statics_date_id VARCHAR2(20) not null,
  send_time           DATE,
  sys_time            TIMESTAMP(6),
  statics_use_time    NUMBER(10),
  status              NUMBER(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_STATICS_DATE
  add constraint PK_SMS_STATICS_DATE primary key (SMS_STATICS_DATE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_STCSDATE_SENDTIME on mc.SMS_STATICS_DATE (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_STATICS_ORG
prompt ==============================
prompt
create table mc.SMS_STATICS_ORG
(
  sms_statics_org_id VARCHAR2(200) not null,
  send_time          DATE,
  org_id             VARCHAR2(200),
  send_status        NUMBER(2),
  mobile_quantities  NUMBER(10),
  sys_time           TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_STATICS_ORG
  add constraint PK_SMS_STATICS_ORG primary key (SMS_STATICS_ORG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_STCSORG_TIME on mc.SMS_STATICS_ORG (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_STATICS_ORG_CHANNEL
prompt ======================================
prompt
create table mc.SMS_STATICS_ORG_CHANNEL
(
  sms_statics_org_channel_id VARCHAR2(200) not null,
  send_time                  DATE,
  org_id                     VARCHAR2(200),
  channel_id                 NUMBER(4),
  send_status                NUMBER(2),
  mobile_quantities          NUMBER(10),
  sys_time                   TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_STATICS_ORG_CHANNEL
  add constraint PK_SMS_STATICS_ORG_CHANNEL primary key (SMS_STATICS_ORG_CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_STCSORGCH_TIME on mc.SMS_STATICS_ORG_CHANNEL (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SURVEY
prompt =========================
prompt
create table mc.SMS_SURVEY
(
  sms_survey_id         VARCHAR2(200) not null,
  sms_survey_name       VARCHAR2(80),
  survey_type           VARCHAR2(20),
  option_number         NUMBER(18),
  status                VARCHAR2(20),
  start_time            DATE,
  end_time              DATE,
  user_id               VARCHAR2(200),
  user_name             VARCHAR2(200),
  user_group_id         VARCHAR2(200),
  user_group_name       VARCHAR2(200),
  biz_number            VARCHAR2(20),
  sms_directive         VARCHAR2(20),
  survey_template       VARCHAR2(200),
  thank_word            VARCHAR2(200),
  spec_response         VARCHAR2(20),
  contact_groups        CLOB,
  black_groups          CLOB,
  survey_valid_type     VARCHAR2(20),
  max_vote_number       VARCHAR2(20),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_SURVEY
  is '���ŵ���';
comment on column mc.SMS_SURVEY.sms_survey_name
  is '��������';
comment on column mc.SMS_SURVEY.survey_type
  is '��������';
comment on column mc.SMS_SURVEY.option_number
  is 'ѡ������';
comment on column mc.SMS_SURVEY.status
  is '״̬';
comment on column mc.SMS_SURVEY.start_time
  is '��ʼʱ��';
comment on column mc.SMS_SURVEY.end_time
  is '����ʱ��';
comment on column mc.SMS_SURVEY.user_id
  is '�û�id';
comment on column mc.SMS_SURVEY.user_name
  is '�û���';
comment on column mc.SMS_SURVEY.user_group_id
  is '�û�Ⱥ��id';
comment on column mc.SMS_SURVEY.user_group_name
  is '�û�Ⱥ����';
comment on column mc.SMS_SURVEY.sms_directive
  is '����ָ��';
comment on column mc.SMS_SURVEY.survey_template
  is '����ģ��';
comment on column mc.SMS_SURVEY.thank_word
  is '��л��';
comment on column mc.SMS_SURVEY.spec_response
  is '�Ƿ��޶��������';
comment on column mc.SMS_SURVEY.contact_groups
  is '��ϵȺ��';
comment on column mc.SMS_SURVEY.black_groups
  is '������';
comment on column mc.SMS_SURVEY.survey_valid_type
  is '��Ч�ظ�';
comment on column mc.SMS_SURVEY.max_vote_number
  is '��������';
comment on column mc.SMS_SURVEY.created_stamp
  is '����ʱ��';
alter table mc.SMS_SURVEY
  add constraint PK_SMS_SURVEY primary key (SMS_SURVEY_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index mc.IDX_SMS_DIRECTIVE on mc.SMS_SURVEY (SMS_DIRECTIVE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.SMS_SURVEY_TXCRTS on mc.SMS_SURVEY (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.SMS_SURVEY_TXSTMP on mc.SMS_SURVEY (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_SURVEY_GROUP
prompt ===============================
prompt
create table mc.SMS_SURVEY_GROUP
(
  sms_survey_id         VARCHAR2(200) not null,
  group_id              VARCHAR2(200) not null,
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SURVEY_GROUP
  is '���ŵ��鱻����';
alter table mc.SMS_SURVEY_GROUP
  add constraint PK_SMS_SURVEY_GROUP primary key (SMS_SURVEY_ID, GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_GRP_TXCRTS on mc.SMS_SURVEY_GROUP (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_GRP_TXSTMP on mc.SMS_SURVEY_GROUP (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SURVEY_ITEM
prompt ==============================
prompt
create table mc.SMS_SURVEY_ITEM
(
  sms_survey_id         VARCHAR2(200) not null,
  surv_item_code        VARCHAR2(10) not null,
  surv_item_name        VARCHAR2(80),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SURVEY_ITEM
  is '���ŵ���ѡ��';
alter table mc.SMS_SURVEY_ITEM
  add constraint PK_SMS_SURVEY_ITEM primary key (SMS_SURVEY_ID, SURV_ITEM_CODE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_ITM_TXCRTS on mc.SMS_SURVEY_ITEM (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_ITM_TXSTMP on mc.SMS_SURVEY_ITEM (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SURVEY_RECORD
prompt ================================
prompt
create table mc.SMS_SURVEY_RECORD
(
  sms_survey_record_id  VARCHAR2(200) not null,
  sms_survey_id         VARCHAR2(200),
  mobile_number         VARCHAR2(20),
  sms_surv_item_code    VARCHAR2(40),
  message_content       VARCHAR2(40),
  message_id            VARCHAR2(200),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SURVEY_RECORD
  is '�����¼';
alter table mc.SMS_SURVEY_RECORD
  add constraint PK_SMS_SURVEY_RECORD primary key (SMS_SURVEY_RECORD_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_RCD_TXCRTS on mc.SMS_SURVEY_RECORD (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_RCD_TXSTMP on mc.SMS_SURVEY_RECORD (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SURVEY_RESPONDENT
prompt ====================================
prompt
create table mc.SMS_SURVEY_RESPONDENT
(
  sms_survey_id         VARCHAR2(200) not null,
  mobile_number         VARCHAR2(20) not null,
  user_name             VARCHAR2(40),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SURVEY_RESPONDENT
  is '���ŵ��鱻����';
alter table mc.SMS_SURVEY_RESPONDENT
  add constraint PK_SMS_SURVEY_RESPONDENT primary key (SMS_SURVEY_ID, MOBILE_NUMBER)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_RSPNT_TXCS on mc.SMS_SURVEY_RESPONDENT (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_RSPNT_TXSP on mc.SMS_SURVEY_RESPONDENT (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_TEST_SEND
prompt ============================
prompt
create table mc.SMS_TEST_SEND
(
  id                  VARCHAR2(200) not null,
  content             VARCHAR2(2000),
  submit_time         DATE,
  mobile_to           VARCHAR2(2000),
  msg_id              VARCHAR2(200),
  user_id             VARCHAR2(200),
  organization_id     VARCHAR2(200),
  wappush_url         VARCHAR2(200),
  date_interval_start NUMBER(4),
  date_interval_end   NUMBER(4),
  time_interval_start VARCHAR2(200),
  time_interval_end   VARCHAR2(200),
  interval            VARCHAR2(200),
  type                NUMBER(2),
  status              NUMBER(2),
  hour_minute         NUMBER(2),
  sys_id              VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_TEST_SEND
  is '���Զ��Ų��Ա�';
comment on column mc.SMS_TEST_SEND.id
  is '���';
comment on column mc.SMS_TEST_SEND.content
  is '���ݣ����Զ�׷��ʱ��';
comment on column mc.SMS_TEST_SEND.submit_time
  is '�ύʱ��';
comment on column mc.SMS_TEST_SEND.mobile_to
  is '�ֻ���, ��Ӣ�Ķ��ŷָ�';
comment on column mc.SMS_TEST_SEND.msg_id
  is '��Ϣ���ʱ��';
comment on column mc.SMS_TEST_SEND.user_id
  is '�ύ�߱��';
comment on column mc.SMS_TEST_SEND.organization_id
  is '�ύ����������';
comment on column mc.SMS_TEST_SEND.wappush_url
  is 'WAPPUSH���ŵ����ӵ�ַ';
comment on column mc.SMS_TEST_SEND.date_interval_start
  is '���Զ������ڼ���Ŀ�ʼʱ��, 2:����һ, 3:���ڶ�, 4:������, 5:������, 6:������, 7:������, 8:������';
comment on column mc.SMS_TEST_SEND.date_interval_end
  is '���Զ������ڼ���Ŀ�ʼʱ��, 2:����һ, 3:���ڶ�, 4:������, 5:������, 6:������, 7:������, 8:������';
comment on column mc.SMS_TEST_SEND.time_interval_start
  is '���Զ���ʱ�����Ŀ�ʼʱ��';
comment on column mc.SMS_TEST_SEND.time_interval_end
  is '���Զ���ʱ�����Ľ���ʱ��';
comment on column mc.SMS_TEST_SEND.interval
  is '���Զ��ŵļ������';
comment on column mc.SMS_TEST_SEND.type
  is '0:��ͨ����, 1:WAPPUSH����';
comment on column mc.SMS_TEST_SEND.status
  is '0:����, 1:��Ч, 2:ʧЧ';
comment on column mc.SMS_TEST_SEND.hour_minute
  is '0:Сʱ, 1:����';
comment on column mc.SMS_TEST_SEND.sys_id
  is '��Ϣ��Դ';
alter table mc.SMS_TEST_SEND
  add constraint PK_SMS_TEST_SEND primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_UNSUBSCRIBE_KEY_WORD
prompt =======================================
prompt
create table mc.SMS_UNSUBSCRIBE_KEY_WORD
(
  key_word_id       VARCHAR2(20) not null,
  key_word          VARCHAR2(200),
  status            NUMBER(1),
  description       VARCHAR2(200),
  sort_index        VARCHAR2(20),
  organization_id   VARCHAR2(50),
  organization_name VARCHAR2(200),
  user_id           VARCHAR2(50),
  user_name         VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_UNSUBSCRIBE_KEY_WORD
  is '�˶��ؼ��ֱ�';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.key_word_id
  is '�ؼ��ֱ��';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.key_word
  is '�ؼ���';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.status
  is '״̬, 0:ʧЧ, 1:��Ч';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.description
  is '��ע';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.sort_index
  is '������';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.organization_id
  is '�������';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.organization_name
  is '��������';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.user_id
  is '�û����';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.user_name
  is '�û�����';
alter table mc.SMS_UNSUBSCRIBE_KEY_WORD
  add constraint PK_SMS_UNSUBSCRIBE_KEY_WORD primary key (KEY_WORD_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_VIP
prompt ======================
prompt
create table mc.SMS_VIP
(
  sms_vip_id         VARCHAR2(50) not null,
  sms_vip_name       VARCHAR2(50),
  sms_vip_share      NUMBER(1) default 0,
  sms_vip_mark       VARCHAR2(100),
  sms_vip_group_id   VARCHAR2(200),
  sms_vip_user_id    VARCHAR2(200),
  phone_number       VARCHAR2(20),
  sms_vip_position   VARCHAR2(50),
  sms_vip_group_name VARCHAR2(100),
  sms_vip_user_name  VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SMS_VIP
  add primary key (SMS_VIP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SQL_LOG
prompt ======================
prompt
create table mc.SQL_LOG
(
  sql_txt  CLOB,
  sys_time TIMESTAMP(6),
  place    VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STYLE_BASE
prompt =========================
prompt
create table mc.STYLE_BASE
(
  style_id   NUMBER(7) not null,
  subject    VARCHAR2(100),
  style_key  VARCHAR2(10),
  thumbnail  VARCHAR2(100),
  status     NUMBER(1),
  creat_time DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.STYLE_BASE
  is 'ƽ̨���������Ϣ��';
comment on column mc.STYLE_BASE.style_id
  is '���';
comment on column mc.STYLE_BASE.subject
  is '��������';
comment on column mc.STYLE_BASE.style_key
  is '�����Ӧ��Ӣ��KEY';
comment on column mc.STYLE_BASE.thumbnail
  is '��������ͼ����';
comment on column mc.STYLE_BASE.status
  is '�Ƿ�����, 0:��Ч����, 1:��Ч����';
comment on column mc.STYLE_BASE.creat_time
  is '����ʱ��';
alter table mc.STYLE_BASE
  add constraint PK_STYLE_BASE primary key (STYLE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STYLE_USER_CONFIG
prompt ================================
prompt
create table mc.STYLE_USER_CONFIG
(
  style_config_id NUMBER(7) not null,
  user_id         VARCHAR2(100),
  user_name       VARCHAR2(100),
  f_id            NUMBER(7),
  creat_time      DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.STYLE_USER_CONFIG
  is '�û���Ӧ�������ñ�';
comment on column mc.STYLE_USER_CONFIG.style_config_id
  is '���';
comment on column mc.STYLE_USER_CONFIG.user_id
  is '�û����, ����ֶ���Ҫ����Ψһ��';
comment on column mc.STYLE_USER_CONFIG.user_name
  is '�û�����';
comment on column mc.STYLE_USER_CONFIG.f_id
  is '���õ�������';
comment on column mc.STYLE_USER_CONFIG.creat_time
  is '����ʱ��';
alter table mc.STYLE_USER_CONFIG
  add constraint PK_STYLE_USER_CONFIG primary key (STYLE_CONFIG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SUBSYS_CODE
prompt ==========================
prompt
create table mc.SUBSYS_CODE
(
  id               VARCHAR2(200) not null,
  subsys_code_id   VARCHAR2(20),
  subsys_code_name VARCHAR2(200),
  extend_number    VARCHAR2(20),
  description      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SUBSYS_CODE
  is '��Ϣ��Դ�����ֵ�';
comment on column mc.SUBSYS_CODE.id
  is '������';
comment on column mc.SUBSYS_CODE.subsys_code_id
  is '��Ϣ��Դ���';
comment on column mc.SUBSYS_CODE.subsys_code_name
  is '��Ϣ��Դ����';
comment on column mc.SUBSYS_CODE.extend_number
  is '��չ��';
comment on column mc.SUBSYS_CODE.description
  is '��ע';
alter table mc.SUBSYS_CODE
  add constraint PK_SUBSYS_CODE primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index mc.IDX_SUBSYSCODE_EXTNUM on mc.SUBSYS_CODE (EXTEND_NUMBER)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_CONFIG
prompt =========================
prompt
create table mc.SYS_CONFIG
(
  config_key   VARCHAR2(200) not null,
  config_value VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SYS_CONFIG
  is 'ϵͳʹ�õ���������';
comment on column mc.SYS_CONFIG.config_key
  is '������, InitedData(�Ƿ��Ѿ���ʼ������),0:δ��ʼ��,1:�Ѿ���ʼ�����Ѿ���ʼ�����ٳ�ʼ��, PROHIBITEDWORD_POWER, 0:�ر�Υ����, 1:����Υ����';
comment on column mc.SYS_CONFIG.config_value
  is '����ֵ';
alter table mc.SYS_CONFIG
  add constraint PK_SYS_CONFIG primary key (CONFIG_KEY)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASK_INFO
prompt ========================
prompt
create table mc.TASK_INFO
(
  id                    VARCHAR2(200) not null,
  org_id                VARCHAR2(200),
  name                  VARCHAR2(200),
  file_url              VARCHAR2(2000),
  content               VARCHAR2(3000),
  type                  NUMBER(10),
  send_status           NUMBER(1),
  reply                 NUMBER(1),
  signature             NUMBER(1),
  prior_id              NUMBER(10),
  time_task             NUMBER(1),
  extend_code           NUMBER(1),
  sub_time_task         NUMBER(19),
  valid_mobile_count    NUMBER(19),
  run_time              DATE,
  create_time           DATE,
  invalid_mobile_count  NUMBER(19),
  user_id               VARCHAR2(200),
  status                NUMBER(10),
  sms_user_type         NUMBER(10),
  send_count            NUMBER(19),
  end_time              DATE,
  client_group          VARCHAR2(2000),
  batch_id              VARCHAR2(2000),
  untreated_mobile      CLOB,
  excel_name            VARCHAR2(2000),
  lose_reason           VARCHAR2(1000),
  original_mobile_count NUMBER(19) default 0,
  black_num             NUMBER(19) default 0,
  prohibited_word_num   NUMBER(19) default 0,
  repeat_num_count      NUMBER(19) default 0,
  illegal_num_count     NUMBER(19) default 0,
  repeat_num            CLOB,
  illegal_num           CLOB,
  report_all_count      NUMBER(19) default 0,
  report_success_count  NUMBER(19) default 0,
  report_failure_count  NUMBER(19) default 0,
  report_unknown_count  NUMBER(19) default 0,
  granter_id            VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column mc.TASK_INFO.id
  is '����';
comment on column mc.TASK_INFO.org_id
  is '����id';
comment on column mc.TASK_INFO.name
  is '������';
comment on column mc.TASK_INFO.file_url
  is '����ģ�巢�͵��ļ�λ��';
comment on column mc.TASK_INFO.content
  is '��������';
comment on column mc.TASK_INFO.type
  is '�������� 0:���� 1:����';
comment on column mc.TASK_INFO.send_status
  is '����״̬';
comment on column mc.TASK_INFO.signature
  is '�û�ǩ��';
comment on column mc.TASK_INFO.prior_id
  is '���ȼ�';
comment on column mc.TASK_INFO.time_task
  is '�Ƿ��Ƕ�ʱ���� 0:���� 1:��';
comment on column mc.TASK_INFO.extend_code
  is '�û���չ��';
comment on column mc.TASK_INFO.valid_mobile_count
  is '��Ч�ĵ绰����������';
comment on column mc.TASK_INFO.run_time
  is '��������ʱ��';
comment on column mc.TASK_INFO.create_time
  is '���񴴽�ʱ��';
comment on column mc.TASK_INFO.invalid_mobile_count
  is '��Ч�ĵ绰����������';
comment on column mc.TASK_INFO.user_id
  is '��¼���͵��û�id';
comment on column mc.TASK_INFO.status
  is '����״̬ 0:δ���� 1:������ 2:��ͣ 3:ֹͣ 4:���ͽ���';
comment on column mc.TASK_INFO.sms_user_type
  is '�û�����';
comment on column mc.TASK_INFO.send_count
  is '����������';
comment on column mc.TASK_INFO.end_time
  is '�������ʱ��';
comment on column mc.TASK_INFO.client_group
  is 'Ⱥ���id';
comment on column mc.TASK_INFO.batch_id
  is '�������Ͷ��ŵ����κ�';
comment on column mc.TASK_INFO.untreated_mobile
  is 'δ����ĺ���,���ڱ�����ͨ���͵ĺ���';
comment on column mc.TASK_INFO.excel_name
  is '�����������͵�excel_name';
comment on column mc.TASK_INFO.lose_reason
  is '����ʧ��ԭ��';
comment on column mc.TASK_INFO.report_all_count
  is '����״̬����������';
comment on column mc.TASK_INFO.report_success_count
  is '����״̬����ɹ�����';
comment on column mc.TASK_INFO.report_failure_count
  is '����״̬����ʧ������';
comment on column mc.TASK_INFO.report_unknown_count
  is 'û�з���״̬��������';
comment on column mc.TASK_INFO.granter_id
  is '����ί����';
alter table mc.TASK_INFO
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEMP_NOT_SEND
prompt ============================
prompt
create table mc.TEMP_NOT_SEND
(
  mobile VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDXXXX on mc.TEMP_NOT_SEND (MOBILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEMP_TABLE_TEST
prompt ==============================
prompt
create table mc.TEMP_TABLE_TEST
(
  create_sql  CLOB,
  create_time DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEST_MOBILE
prompt ==========================
prompt
create table mc.TEST_MOBILE
(
  mobile VARCHAR2(20),
  times  NUMBER
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEST_STRM
prompt ========================
prompt
create table mc.TEST_STRM
(
  id   NUMBER(2) not null,
  name VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.TEST_STRM
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table TMP_MOBILE_MEDIA
prompt ===============================
prompt
create table mc.TMP_MOBILE_MEDIA
(
  mobile_to VARCHAR2(20),
  sys_time  TIMESTAMP(6),
  status    NUMBER,
  report    VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_TMP_MOBILE_MEDIA_MOBILE on mc.TMP_MOBILE_MEDIA (MOBILE_TO)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table UNIT_PRICE_INFO
prompt ==============================
prompt
create table mc.UNIT_PRICE_INFO
(
  price_id          VARCHAR2(200) not null,
  organization_id   VARCHAR2(200) not null,
  unit_price        NUMBER(5,3) not null,
  start_date        DATE not null,
  end_date          DATE,
  create_date       DATE default sysdate,
  effective         NUMBER,
  remark            VARCHAR2(200),
  organization_name VARCHAR2(200),
  gw_type           NUMBER(1) default 0,
  biz_type          NUMBER(1) default 0,
  channel_id        NUMBER(5) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.UNIT_PRICE_INFO
  is '�����۸���Ϣ��';
comment on column mc.UNIT_PRICE_INFO.price_id
  is 'ID';
comment on column mc.UNIT_PRICE_INFO.organization_id
  is '������id';
comment on column mc.UNIT_PRICE_INFO.unit_price
  is '�鵥��';
comment on column mc.UNIT_PRICE_INFO.start_date
  is '��ʼ����';
comment on column mc.UNIT_PRICE_INFO.end_date
  is '��ֹ����';
comment on column mc.UNIT_PRICE_INFO.create_date
  is '����ʱ��';
comment on column mc.UNIT_PRICE_INFO.effective
  is '�Ƿ���ʷ����   0������ʷ���ۣ�1����ʷ����';
comment on column mc.UNIT_PRICE_INFO.remark
  is '��ע';
comment on column mc.UNIT_PRICE_INFO.organization_name
  is '����������';
comment on column mc.UNIT_PRICE_INFO.gw_type
  is '�Ŷ����͡�0-ȫ��·��1-�ƶ��ŶΣ�2-��ͨ�ŶΣ�3-С��ͨ�Ŷ�';
comment on column mc.UNIT_PRICE_INFO.biz_type
  is 'ҵ�����͡�0-��ͨ����ҵ��1-����ҵ��2-emailҵ��';
comment on column mc.UNIT_PRICE_INFO.channel_id
  is '����ͨ����0-����ͨ��';
alter table mc.UNIT_PRICE_INFO
  add constraint UNIT_PRICE_INFO_PK primary key (PRICE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USER_COMMON_CONFIG
prompt =================================
prompt
create table mc.USER_COMMON_CONFIG
(
  id                      NUMBER(18) not null,
  user_id                 VARCHAR2(200),
  black_level             CHAR(1) default '0' not null,
  is_sensitive_time_delay CHAR(1) default '0'
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.USER_COMMON_CONFIG
  is '�û������������ñ�';
comment on column mc.USER_COMMON_CONFIG.id
  is '����';
comment on column mc.USER_COMMON_CONFIG.user_id
  is '�û�UUID';
comment on column mc.USER_COMMON_CONFIG.black_level
  is '�����������0��ֻ���BLACK��������1�����BLACK��BLACK_CSMD��������2�����BLACK��BLACK_CSMD��BLACK_ZHUOYUE������';
comment on column mc.USER_COMMON_CONFIG.is_sensitive_time_delay
  is '�Ƿ������ʱ���ӳ٣�1��������ʱ���ӳ٣�0��������ʱ�䲻�ӳ�';
alter table mc.USER_COMMON_CONFIG
  add constraint PK_USER_COMMON_CONFIG primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.USER_COMMON_CONFIG
  add constraint FK_USER_COM_REFERENCE_USER_INF foreign key (USER_ID)
  references mc.USER_INFO (USER_ID);

prompt
prompt Creating table USER_CONFIG_INFO
prompt ===============================
prompt
create table mc.USER_CONFIG_INFO
(
  config_id  VARCHAR2(200) not null,
  channel_id VARCHAR2(200),
  key        VARCHAR2(50),
  value      VARCHAR2(100),
  remark     VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.USER_CONFIG_INFO
  is '�û�����';
comment on column mc.USER_CONFIG_INFO.config_id
  is '���ñ��';
comment on column mc.USER_CONFIG_INFO.channel_id
  is 'ͨ�����';
comment on column mc.USER_CONFIG_INFO.key
  is '�ؼ���';
comment on column mc.USER_CONFIG_INFO.value
  is 'ֵ';
comment on column mc.USER_CONFIG_INFO.remark
  is '��ע';
alter table mc.USER_CONFIG_INFO
  add constraint PK_USER_CONFIG_INFO primary key (CONFIG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USER_CONFIG_KEY_INFO
prompt ===================================
prompt
create table mc.USER_CONFIG_KEY_INFO
(
  config_key_id   VARCHAR2(200) not null,
  config_key_name VARCHAR2(50),
  remark          VARCHAR2(200),
  config_key_type VARCHAR2(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.USER_CONFIG_KEY_INFO
  is '�û����ùؼ����ֵ��';
comment on column mc.USER_CONFIG_KEY_INFO.config_key_id
  is '���ùؼ��ֱ��';
comment on column mc.USER_CONFIG_KEY_INFO.config_key_name
  is '�ؼ���';
comment on column mc.USER_CONFIG_KEY_INFO.remark
  is '��ע';
comment on column mc.USER_CONFIG_KEY_INFO.config_key_type
  is '�ؼ�������, -1:ȫͨ������, 1:��ͨ������';
alter table mc.USER_CONFIG_KEY_INFO
  add constraint PK_USER_CONFIG_KEY_INFO primary key (CONFIG_KEY_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table USER_SEND_GRANT
prompt ==============================
prompt
create table mc.USER_SEND_GRANT
(
  id           VARCHAR2(100) not null,
  grantee_id   VARCHAR2(100) not null,
  granter_id   VARCHAR2(100) not null,
  grant_type   VARCHAR2(10) not null,
  grant_remark VARCHAR2(200),
  system_time  DATE default sysdate
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.USER_SEND_GRANT
  is '�û�������Ȩ��';
comment on column mc.USER_SEND_GRANT.id
  is 'id';
comment on column mc.USER_SEND_GRANT.grantee_id
  is '����Ȩ��id ������ʵ�ʷ�����';
comment on column mc.USER_SEND_GRANT.granter_id
  is '��Ȩ��id ������ʵ��������';
comment on column mc.USER_SEND_GRANT.grant_type
  is '�������͡���ΪΪ����������Ϊ���˴�������Ȩ��id�ܸ��ֶ�Ӱ��ֱ�����ǻ���id���û�id�� ������1��ʾ���û���0��ʾ';
comment on column mc.USER_SEND_GRANT.grant_remark
  is '��ע��Ϣ';
comment on column mc.USER_SEND_GRANT.system_time
  is '��Ȩ��ϵ������';
alter table mc.USER_SEND_GRANT
  add constraint PK_USER_SEND_GRANT primary key (ID)
  disable;

prompt
prompt Creating table VIEW_CHANNEL_SWITCH_LOG
prompt ======================================
prompt
create table mc.VIEW_CHANNEL_SWITCH_LOG
(
  pid                   VARCHAR2(200) not null,
  original_channel_id   NUMBER(5),
  original_channel_name VARCHAR2(500),
  dest_channel_id       NUMBER(5),
  dest_channel_name     VARCHAR2(500),
  match_org_id          VARCHAR2(200),
  match_org_name        VARCHAR2(200),
  match_user_id         VARCHAR2(200),
  match_user_name       VARCHAR2(200),
  match_quantity        NUMBER(19),
  match_mobile          VARCHAR2(100),
  match_batch_id        VARCHAR2(200),
  match_content         VARCHAR2(200),
  match_operator        NUMBER(3),
  direction             NUMBER(3),
  operator_id           VARCHAR2(200),
  operator_user_name    VARCHAR2(200),
  operation_date        DATE,
  operation_result      NUMBER(3),
  operation_result_desc VARCHAR2(500),
  belong_pid            VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.VIEW_CHANNEL_SWITCH_LOG
  add primary key (PID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table VIP_SPECIAL_INFO
prompt ===============================
prompt
create table mc.VIP_SPECIAL_INFO
(
  vip_special_info_id NUMBER(18) not null,
  send_msg            VARCHAR2(600),
  status              NUMBER(18),
  subscribe_number    VARCHAR2(50),
  user_id             VARCHAR2(50),
  user_name           VARCHAR2(50),
  organization_id     VARCHAR2(50),
  organization_name   VARCHAR2(50),
  create_time         DATE,
  audit_time          DATE,
  send_time           DATE,
  product_id          VARCHAR2(600)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.VIP_SPECIAL_INFO
  add constraint PK_VIP_SPECIAL_INFO primary key (VIP_SPECIAL_INFO_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WHITE_INFO
prompt =========================
prompt
create table mc.WHITE_INFO
(
  org_id                VARCHAR2(50) not null,
  user_id               VARCHAR2(200) not null,
  mobile                VARCHAR2(50) not null,
  user_name             VARCHAR2(50),
  created_stamp         DATE,
  created_tx_stamp      DATE default sysdate,
  last_updated_stamp    DATE,
  last_updated_tx_stamp DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.WHITE_INFO
  add primary key (ORG_ID, USER_ID, MOBILE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.WHITE_INFO
  add constraint FK2E115F24D5594142 foreign key (USER_ID)
  references mc.USER_INFO (USER_ID);

prompt
prompt Creating table WHITE_JOB_CONFIG
prompt ===============================
prompt
create table mc.WHITE_JOB_CONFIG
(
  org_id             VARCHAR2(50) not null,
  do_congratulations VARCHAR2(20),
  action_time        DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.WHITE_JOB_CONFIG
  add primary key (ORG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WHITE_ORG_CONFIG
prompt ===============================
prompt
create table mc.WHITE_ORG_CONFIG
(
  org_id   VARCHAR2(50) not null,
  mo_owner VARCHAR2(12)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.WHITE_ORG_CONFIG
  add primary key (ORG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table Z_BOFENG_ALL
prompt ===========================
prompt
create table mc.Z_BOFENG_ALL
(
  mobile VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.Z_BF_M_ALL on mc.Z_BOFENG_ALL (MOBILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table Z_BOFENG_MOBILE
prompt ==============================
prompt
create table mc.Z_BOFENG_MOBILE
(
  mobile VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
create index mc.Z_BF_M_M on mc.Z_BOFENG_MOBILE (MOBILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence HIBERNATE_SEQUENCE
prompt ====================================
prompt
create sequence mc.HIBERNATE_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 36022
increment by 1
cache 20;

prompt
prompt Creating sequence MMS_SEND_SEQ
prompt ==============================
prompt
create sequence mc.MMS_SEND_SEQ
minvalue 10000
maxvalue 9999999999999999999
start with 100000
increment by 1
cache 20;

prompt
prompt Creating sequence MMS_STOCK_PAPER_ID_SEQUENCE
prompt =============================================
prompt
create sequence mc.MMS_STOCK_PAPER_ID_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PERMIT_WORD_SEQ
prompt =================================
prompt
create sequence mc.PERMIT_WORD_SEQ
minvalue 1
maxvalue 9999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence PRODUCT_SEQ
prompt =============================
prompt
create sequence mc.PRODUCT_SEQ
minvalue 100000
maxvalue 999999999999999999999999999
start with 100000
increment by 1
cache 2;

prompt
prompt Creating sequence PROHIBIT_WORD_SEQ
prompt ===================================
prompt
create sequence mc.PROHIBIT_WORD_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 10
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CHANNEL_USER
prompt ==================================
prompt
create sequence mc.SEQ_CHANNEL_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 4012
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MMSSCHEDULE
prompt =================================
prompt
create sequence mc.SEQ_MMSSCHEDULE
minvalue 1
maxvalue 9999999999999999999999999999
start with 181
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MMS_SEND
prompt ==============================
prompt
create sequence mc.SEQ_MMS_SEND
minvalue 1
maxvalue 9999999999999999999999999999
start with 181
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_NITICE_USER
prompt =================================
prompt
create sequence mc.SEQ_NITICE_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 1311
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_NOTICE
prompt ============================
prompt
create sequence mc.SEQ_NOTICE
minvalue 1
maxvalue 9999999999999999999999999999
start with 282
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ORDER_INFO
prompt ================================
prompt
create sequence mc.SEQ_ORDER_INFO
minvalue 0
maxvalue 999999999999999
start with 604
increment by 1
nocache;

prompt
prompt Creating sequence SEQ_ORGANIZATION
prompt ==================================
prompt
create sequence mc.SEQ_ORGANIZATION
minvalue 1
maxvalue 9999999999999999999999999999
start with 562
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ORG_CONFIG
prompt ================================
prompt
create sequence mc.SEQ_ORG_CONFIG
minvalue 1
maxvalue 9999999999999999999999999999
start with 481
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PAYMENT_RECORD
prompt ====================================
prompt
create sequence mc.SEQ_PAYMENT_RECORD
minvalue 1
maxvalue 9999999999999999999999999999
start with 3026
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROLE
prompt ==========================
prompt
create sequence mc.SEQ_ROLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 901
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROLE_PERMISSION
prompt =====================================
prompt
create sequence mc.SEQ_ROLE_PERMISSION
minvalue 1
maxvalue 9999999999999999999999999999
start with 681
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_RULE_ITEM
prompt ===============================
prompt
create sequence mc.SEQ_RULE_ITEM
minvalue 1
maxvalue 999999999999999999999999999
start with 1869
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence SEQ_TASKINFO
prompt ==============================
prompt
create sequence mc.SEQ_TASKINFO
minvalue 1
maxvalue 9999999999999999999999999999
start with 18847
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_USERINFO
prompt ==============================
prompt
create sequence mc.SEQ_USERINFO
minvalue 1
maxvalue 9999999999999999999999999999
start with 841
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_ACCOUNT_CHANNEL_SEQ
prompt =========================================
prompt
create sequence mc.SGW_ACCOUNT_CHANNEL_SEQ
minvalue 1
maxvalue 999999999999999999999
start with 161
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_ACCOUNT_INFO_SEQ
prompt ======================================
prompt
create sequence mc.SGW_ACCOUNT_INFO_SEQ
minvalue 1
maxvalue 99999999999999999999
start with 121
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_CUSTOMER_SEQ
prompt ==================================
prompt
create sequence mc.SGW_CUSTOMER_SEQ
minvalue 1
maxvalue 9999999999999999999999
start with 101
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_MO_TASK_SEQ
prompt =================================
prompt
create sequence mc.SGW_MO_TASK_SEQ
minvalue 1
maxvalue 99999999999999999999999
start with 561
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_REPORT_TASK_SEQ
prompt =====================================
prompt
create sequence mc.SGW_REPORT_TASK_SEQ
minvalue 1
maxvalue 99999999999999999999
start with 6838961
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_SIGNATURE_POOL_SEQ
prompt ========================================
prompt
create sequence mc.SGW_SIGNATURE_POOL_SEQ
minvalue 1
maxvalue 999999999999999999999
start with 141
increment by 1
cache 20;

prompt
prompt Creating sequence SMS_RECEIVE_SEQ
prompt =================================
prompt
create sequence mc.SMS_RECEIVE_SEQ
minvalue 10000
maxvalue 9999999999999999999
start with 100060
increment by 1
cache 20;

prompt
prompt Creating sequence SMS_SEND_SEQ
prompt ==============================
prompt
create sequence mc.SMS_SEND_SEQ
minvalue 5000000
maxvalue 9999999999999999999
start with 5000000
increment by 1
cache 20;

prompt
prompt Creating sequence USER_COMMON_CONFIG_SEQ
prompt ========================================
prompt
create sequence mc.USER_COMMON_CONFIG_SEQ
minvalue 1
maxvalue 999999999999999999999
start with 221
increment by 1
cache 20;

prompt
prompt Creating sequence VIP_SPECIAL_INFO_ID_SEQUENCE
prompt ==============================================
prompt
create sequence mc.VIP_SPECIAL_INFO_ID_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating view BLACK_USER_ORG
prompt ============================
prompt
create or replace view mc.black_user_org as
select b.black_id,b.black_mobile,b.black_desc,b.black_type,b.oper_userid,b.oper_orgid,b.group_id,u.user_name as oper_userName, o.user_name as org_name,oper_org.user_name as oper_org_name
                     from black b left join user_info u on b.oper_userid = u.user_id left join  organization o on b.group_id = o.user_id left join organization oper_org on b.oper_orgid = oper_org.user_id;

prompt
prompt Creating view CUSTOMER_GROUP_USER_VIEW
prompt ======================================
prompt
create or replace view mc.customer_group_user_view as
select
       c.customer_id,
       c.mobile_user_name,
       c.mobile,
       c.email,
       c.create_user_id,
       c.organization_id as customer_org_id,
       c.create_time,
       c.mobile_remark,
       u.user_id,
       u.user_name,
       g.group_id,
       g.group_name,
       g.organization_id
  from customer_group cg
  left join group_info g on g.group_id = cg.group_id
  left join customer c on cg.customer_id = c.customer_id
  left join user_info u on g.user_id = u.user_id;

prompt
prompt Creating view CUSTOMER_USER_VIEW
prompt ================================
prompt
create or replace view mc.customer_user_view as
select
       sys_guid() id,
       c.customer_id,
       c.mobile_user_name,
       c.mobile,
       c.email,
       c.organization_id as customer_org_id,
       c.create_user_id,
       c.create_time,
       c.mobile_remark,
       u.user_id,
       u.user_name,
       g.group_id,
       g.group_name,
       g.organization_id
  from customer c
  left join customer_group cg on c.customer_id = cg.customer_id
  left join group_info g on g.group_id = cg.group_id
  left join user_info u on g.user_id = u.user_id;

prompt
prompt Creating view GROUP_INFO_VIEW
prompt =============================
prompt
create or replace view mc.group_info_view as
select "GROUP_ID","USER_ID","GROUP_NAME","GROUP_REMARK","CREATE_TIME","MODIFY_TIME","ORGANIZATION_ID","CREATE_USER_ID","IS_SHARE" from group_info a where a.group_id in(select c.group_id from group_info c group by c.group_id having count(c.group_id)=1);

prompt
prompt Creating view PAYMENT_RECORD_USER_ORG
prompt =====================================
prompt
create or replace view mc.payment_record_user_org as
select
pr.payment_id,pr.user_id,pr.user_type,(case
when  pr.user_type='1' then o.user_name
when pr.user_type='0' then ui.user_name
end) user_name,pr.payment_time,pr.payment_money,pr.payment_type,pr.payment_quota,pr.quota_type,(select u.user_name from user_info u where u.user_id=pr.operator_id) operator_id ,
pr.is_online,pr.recharge_explain,pr.is_success
 from payment_record pr left join user_info ui on pr.user_id=ui.user_id left join organization o on pr.user_id=o.user_id;

prompt
prompt Creating view USER_ORG_DATA
prompt ===========================
prompt
create or replace view mc.user_org_data as
select o.user_name as user_name,u.nick_name as nick_name,o.pay_mode as pay_mode,
u.mobile as mobile,o.user_balance as user_balance,o.user_name as org_name,o.user_id as user_id,o.parentid as parentid,
o.user_quota as sms_quota,o.mms_quota as mms_quota,o.pay_type as pay_type,
u.user_type as user_type,u.user_stat as user_stat from organization o inner join  user_info u on o.user_id=u.organization_id;

prompt
prompt Creating view VIEW_CHANNEL_RULE_SET_ITEM
prompt ========================================
prompt
create or replace view mc.view_channel_rule_set_item as
select  u.user_name username,o.user_name orgName,s.RULE_SET_ITEM_NAME ruleSetItemName,s.SALIENCE,s.is_wappush,s.default_mobile_channel_id,s.default_union_channel_id,
        s.default_dx_channel_id,s.rule_set_item_id,s.org_id,s.USER_ID
 from SMS_CHANNEL_RULE_SET_ITEM s
    left join organization o on o.user_id = s.org_id
    left join user_info u on u.user_id = s.user_id;

prompt
prompt Creating view VIEW_CMPP_ACCOUNT
prompt ===============================
prompt
create or replace view mc.view_cmpp_account as
select
      u.user_id                     user_id,      --�û����
      u.user_name                   user_name,    --�˻���¼��
      u.user_kind                   user_kind,    --�˻����1��Webƽ̨�û���2��WebService�ӿ��û���3��CMPP�ӿ��û���4��HTTP�ӿ��û�
      ucc.black_level               black_level,  --����������
      ucc.is_sensitive_time_delay   is_sensitive_time_delay,--�Ƿ������ʱ���ӳ٣�1��������ʱ���ӳ٣�0��������ʱ�䲻�ӳ�
      org.user_id                   org_id,       --����ID
      org.eng_signature             eng_signature,  --Ӣ������ǩ��
      org.chn_signature             chn_signature,  --��������ǩ��
      org.extend_number             extend_number,  --��չ��
      sc.sgw_id                     sgw_id,       --���ر�ţ�CMPP�˻���������Ϣ)
      sc.account_pass               account_pass, --�����˻�����
      sc.registed_ip                registed_ip,  --�ͻ���ע��IP
      sc.prior_id                   prior_id,     --���ȼ�
      sc.flux_limit                 flux_limit,   --����
      sc.mt_worker_num              mt_worker_num,--���д����߳�����
      sc.mt_cache_num               mt_cache_num, --���л�����г���
      sc.server_active_test         server_active_test,--����˷�����·��� 0:������, 1:����
      sc.is_channel_account         is_channel_account,--�Ƿ������˺ţ� 0:��, 1:��
      sc.signature_type             signature_type,--ǩ�����ͣ�1����ͨ����ǩ����2���Ӷ˿�����ǩ����3������ǩ������Ҫͨ��ǩ���ع��˼�飩
      sc.check_prohibitedword       check_prohibitedword,--�Ƿ���Υ���ʣ� 0:��, 1:��
      sc.comments                   comments,
      sc.sys_time                   sys_time,
      sc.trustedaccount             trustedAccount
FROM user_info u
left join sgw_account_info sc on sc.user_id = u.user_id
left join user_common_config ucc on ucc.user_id = u.user_id
LEFT JOIN ORGANIZATION org ON org.user_id = u.organization_id
--where u.USER_STAT = 1 --��Ч
with read only;

prompt
prompt Creating view VIEW_CMPP_ACCOUNT_INFO
prompt ====================================
prompt
create or replace view mc.view_cmpp_account_info as
select acc."SGW_ID",acc."TRUSTEDACCOUNT",acc."USER_ID",acc."ACCOUNT_PASS",acc."REGISTED_IP",acc."PRIOR_ID",acc."FLUX_LIMIT",acc."MT_WORKER_NUM",acc."MT_CACHE_NUM",acc."SERVER_ACTIVE_TEST",acc."IS_CHANNEL_ACCOUNT",acc."SIGNATURE_TYPE",acc."CHECK_PROHIBITEDWORD",acc."COMMENTS",acc."SYS_TIME",
       us.user_name


from sgw_account_info acc left join user_info us on acc.user_id=us.user_id;

prompt
prompt Creating view VIEW_ORANIZATION
prompt ==============================
prompt
CREATE OR REPLACE VIEW mc.VIEW_ORANIZATION AS
SELECT org.user_id              org_id,     --�������
       org.user_name            org_name,    --��������
       org.parentid             org_parentid --�������ڵ�
 FROM ORGANIZATION org
 where org.user_stat = 1    --��Ч��������1��Ч��������0����Ч��
with read only;

prompt
prompt Creating view VIEW_RT_RECEIVE_REPORT_URL
prompt ========================================
prompt
create or replace view mc.view_rt_receive_report_url as
select
       r.url_id,r.user_id,u.user_name as user_name,r.push_channel,r.format_str,r.push_url,r.push_url_type,r.create_time,r.status,r.is_certification,r.user_name as client_user_name,r.pass_word as client_pass_word,r.uanswer_times,r.next_push_time
    from RT_RECEIVE_REPORT_URL r inner join  USER_INFO u on r.user_id =u.user_id;

prompt
prompt Creating view VIEW_USER_CUSTOMER_ORG
prompt ====================================
prompt
CREATE OR REPLACE VIEW mc.VIEW_USER_CUSTOMER_ORG AS
SELECT customer."CUSTOMER_ID",customer."CUSTOMER_NAME",customer."P_CUSTOMER_ID",customer."USER_ID",customer."ORG_ID",customer."SUB_EXTEND_NUMBER",customer."COMMENTS",customer."CUSTOMER_STATUS",customer."SYS_TIME",
       userinfo.user_name           user_name,      --�û��˺�
       org.user_name                org_name,       --��������
       org.eng_signature            eng_signature,  --Ӣ��ǩ��
       org.chn_signature            chn_signature   --����ǩ��
FROM sgw_customer customer
LEFT JOIN ORGANIZATION org ON org.user_id = customer.org_id   --������
LEFT JOIN User_Info userinfo ON userinfo.user_id = customer.user_id --�û���
with read only;

prompt
prompt Creating view VIEW_USER_SGW_SIGNATURE_POOL
prompt ==========================================
prompt
CREATE OR REPLACE VIEW mc.VIEW_USER_SGW_SIGNATURE_POOL AS
SELECT signaturepool."SIGNATURE_ID",signaturepool."CUSTOMER_ID",signaturepool."SIGNATURE",signaturepool."DESCRIPTION",signaturepool."SORT_INDEX",signaturepool."DO_APPEND_MSG",signaturepool."APPEND_MSG",signaturepool."BLACK_LEVEL",signaturepool."COMMENTS",signaturepool."SIGNATURE_STATUS",signaturepool."SYS_TIME",
       customer.org_id,               --�������
       customer.p_customer_id,        --�ͻ���ID
       customer.customer_name,        --�ͻ�����
       userinfo.user_id,              --�û�ID
       userinfo.user_name   user_name,--�û��˺�
       org.user_name        org_name --��������
FROM sgw_signature_pool  signaturepool            --ǩ���ر�
LEFT JOIN sgw_customer customer ON customer.customer_id = signaturepool.customer_id --ǩ���ر�
LEFT JOIN ORGANIZATION org ON org.user_id = customer.org_id   --������
LEFT JOIN User_Info userinfo ON userinfo.user_id = customer.user_id --�û���
with read only;

prompt
prompt Creating view VIP_USER_ORG
prompt ==========================
prompt
create or replace view mc.vip_user_org as
select s."SMS_VIP_ID",s."SMS_VIP_NAME",s."SMS_VIP_GROUP_ID", s.sms_vip_mark,s.sms_vip_share,s."SMS_VIP_USER_ID",s."PHONE_NUMBER",u.user_name as user_name, o.user_name as org_name
                     from sms_vip s left join user_info u on s.sms_vip_user_id = u.user_id left join  organization o on s.sms_vip_group_id = o.user_id;

prompt
prompt Creating view V_SMS_ANALYZE
prompt ===========================
prompt
create or replace view mc.v_sms_analyze as
select o.user_name as org_name,u.user_name,sa.quantity,sa.stat_time,sa.org_id,sa.user_id,sa.status from sms_send_analyze sa
inner join organization o on o.user_id=sa.org_id
inner join user_info u on u.user_id=sa.user_id;

prompt
prompt Creating view V_CUSTOMER_MANAGER_ORG_DATA
prompt =========================================
prompt
create or replace view mc.v_customer_manager_org_data as
select o.user_name,o.user_id,us.nick_name,o.customer_manager_id,v.stat_time,sum(v.quantity) quantity,o.pay_mode,o.user_quota,o.mms_quota,o.user_balance,orgconfig.company_tel
 from organization o left join v_sms_analyze v on v.org_id=o.user_id
 left join org_config orgconfig on orgconfig.organization_id=o.user_id left join user_info us on o.customer_manager_id=us.user_id
 group by o.user_name,o.user_id,us.nick_name,o.customer_manager_id,v.stat_time,o.pay_mode,o.user_quota,o.mms_quota,o.user_balance,orgconfig.company_tel;

prompt
prompt Creating view V_NOTICE_USER
prompt ===========================
prompt
create or replace view mc.v_notice_user as
select  n."ID",n."CONTENT",n."UPLOAD_DATE",n."OPERATOR_ID",n."TITLE",n."VIABLE_DATE",
n."SEND_USER_TYPE",n."IS_PASTDUE",u.user_name,u.nick_name from
notice n inner join user_info u on n.operator_id=u.user_id;

prompt
prompt Creating view V_SEND_USER
prompt =========================
prompt
create or replace view mc.v_send_user as
select send.send_id,
       ui.user_id,
       send.mobile_to,
       ui.user_name,
       send.send_msg,
       send.send_time,
       send.user_organization,
       send.send_status,
       send.report,
       send.longsms_splited,
       send.pre_send_time,
       send.channel_id,
       send.mobile_com,
       send.signature,
       send.is_original_sms,
       send.mobile_quantities,
       send.is_longsms,
       send.sys_time
 from send send
 inner join user_info ui on send.user_id = ui.user_id
 order by send.send_time desc nulls last;

prompt
prompt Creating view V_SEND_USER_ORG
prompt =============================
prompt
create or replace view mc.v_send_user_org as
select s."SEND_ID",s."MOBILE_TO",s."SEND_MSG",s."SP_SERV_NO",s."SYS_TIME",s."PRIOR_ID",s."PRE_SEND_TIME",s."SEND_STATUS",s."SEND_TIME",s."COM_RTN_TIME",s."ERR_MSG",s."REPORT",s."REPORT_TIME",s."CHANNEL_ID",s."MOBILE_COM",s."REMARK",s."USER_ID",s."SEQUENCE",s."MOBILE_QUANTITIES",s."RESEND_TIMES",s."SIGNATURE",s."USER_ORGANIZATION",s."BATCH_ID",s."MSG_TYPE",s."CONSUME_SEND_ID",s."IS_LONGSMS",s."IS_ORIGINAL_SMS",s."ORIGINALSMS_SENDID",s."CURRENT_PAGENO",s."ORIGINALSMS_TOTALPAGES",s."LONGSMS_TAG",s."LONGSMS_SPLITED",s."GW_SUBMIT_TIME",s."GW_DONE_TIME",s."UNIT_PRICE",s."RETURN_FEE",s."RECEIVE_ID",s."EXTRA_KEYWORD_NUM",u.user_name user_name,o.user_name org_name from send s left join user_info u on s.user_id=u.user_id left join organization o on s.user_organization=o.user_id;

prompt
prompt Creating view V_SMS_HOMEPAGE_USERSEND
prompt =====================================
prompt
create or replace view mc.v_sms_homepage_usersend as
select u.user_id,
       u.user_name nick_name,
       u.user_balance,
       u.user_quota,
       u.mms_quota,
       u.pay_mode,
       u.organization_id org_id,
       u.email,
       u.mobile,
       nvl(sum(s.mobile_quantities), 0) quantity
  from user_info u
  left join send s on s.user_id = u.user_id
       and to_char(s.send_time, 'yyyy-mm-dd') = to_char(sysdate - 1, 'yyyy-mm-dd')
       and s.is_original_sms = 0
  where u.user_stat=1
  group by u.user_id,
          u.user_name,
          u.user_balance,
          u.user_quota,
          u.mms_quota,
          u.pay_mode,
          u.organization_id,
          u.email,
          u.mobile;

prompt
prompt Creating view V_SMS_USER_BY_TIME
prompt ================================
prompt
create or replace view mc.v_sms_user_by_time as
select rownum id,u.user_id,u.nick_name,u.user_balance,u.user_quota,u.mms_quota,u.pay_mode,vs.org_id,u.email,
u.mobile,vs.quantity,vs.stat_time from user_info u
left join v_sms_analyze vs on u.user_id=vs.user_id;

prompt
prompt Creating view V_TASKINFO_USER
prompt =============================
prompt
create or replace view mc.v_taskinfo_user as
select
  t.id,
  t.org_id,
  t.name,
  t.file_url,
  t.content,
  t.type,
  t.send_status,
  t.reply,
  t.signature,
  t.prior_id,
  t.time_task,
  t.extend_code,
  t.sub_time_task,
  t.valid_mobile_count,
  t.run_time,
  t.create_time,
  t.invalid_mobile_count,
  t.user_id,
  u.user_name,
  t.status,
  t.sms_user_type,
  t.send_count,
  t.end_time,
  t.client_group,
  t.batch_id,
  t.untreated_mobile,
  t.excel_name,
  t.lose_reason,
  t.original_mobile_count,
  t.black_num,
  t.repeat_num_count,
  t.prohibited_word_num,
  t.illegal_num_count,
  t.report_all_count,
  (nvl(t.report_success_count,0)+nvl(t.report_unknown_count,0)) report_success_count,
  nvl(t.report_failure_count,0)  report_failure_count,
  t.report_unknown_count,
  t.granter_id,
  (select u.user_name from user_info u where u.user_id=t.granter_id) granterName
  from task_info t
  LEFT join  user_info u on t.user_id= u.user_id;

prompt
prompt Creating package REPORT_RECKONING_PACKAGE
prompt =========================================
prompt
create or replace package mc.REPORT_RECKONING_PACKAGE is
   -- Author  : zhanhh
   --����洢���̰�
   -- Created : 2013/6/11 11:04:24

/**
  * �սᵥ��ʱ��������
  * ��ѯ����,Ȼ������սᵥ��daily_reckoning_info�Ĵ洢����
  * Author  : zhanhh
  * Created : 2013-06-28 16:56:32
  *
*/
  procedure INSERT_DAILY_RECKONING_REPORT;


/**
  * ���˵���ʱ��������
  * ��ѯ����,Ȼ��������˵���insert_month_reckoning_report�Ĵ洢����
  * Author  : zhanhh
  * Created : 2013-07-03 18:49:32
  *
*/
  procedure INSERT_MONTH_RECKONING_REPORT;

  /**
  * �սᵥ��ѯ
  * Author  : zhanhh
  * Created : 2013-07-04 16:01:32
  *
*/
  procedure QUERY_RECKONING_INFO_REPORT;

/**
  * ���˵���ѯ
  * Author  : zhanhh
  * Created : 2013-07-04 16:01:32
  *
*/
  procedure QUERY_MONTH_INFO_REPORT;

/* ���շ�������ʧ�ܵĶ��ŷ��ø��û�
*  Author  : zhanhh
*  Created : 2013-07-04 16:01:32
*  ҵ��˵����
*  ������ͨ��: ���ò��,ֻ��ԭʼ��������
*  ֱ��ͨ��: �̶���--���ò��,ֻ��ԭʼ��������;������--ֻ�����ֺ�Ķ�������
*/
   procedure P_SMS_RETURN_FEE;

end REPORT_RECKONING_PACKAGE;
/

prompt
prompt Creating type TYP_TABELTYPE
prompt ===========================
prompt
CREATE OR REPLACE TYPE mc."TYP_TABELTYPE"                                          is object(channel_id varchar2(200),gw_type varchar2(200),send_quantity number(10))
/

prompt
prompt Creating type TYP_TABEL
prompt =======================
prompt
CREATE OR REPLACE TYPE mc."TYP_TABEL"                                          is table of TYP_TABELTYPE
/

prompt
prompt Creating function FNC_CON_STR_TO_TAB
prompt ====================================
prompt
CREATE OR REPLACE FUNCTION mc.FNC_CON_STR_TO_TAB(P_STR IN VARCHAR2) RETURN TYP_TABEL AS

/*
������
    ��ͨ��-�Ŷ�-����Ϊ�ַ������в��
��ѯ������
    �ޡ�
��ʽ��
    �ޡ�
�㷨��
    �ޡ�
��ע��
   �磺
select *  from table(FNC_CON_STR_TO_TAB('122:1-400;123:2-500;124:3-200;'));
--------------------------------------------------------------------------------
channel_id|gw_type|send_quantity
122       |  1    |  400
123       |  2    |  500
124       |  3    |  200

*/

  LSTR  VARCHAR2(10240) DEFAULT P_STR;
  LSTR2 varchar2(1000);
  gw_type varchar2(200);
  channel_id varchar2(200);
  send_quantity number(10);
  LN    NUMBER;
  t_Object TYP_TABELTYPE;
  LDATA TYP_TABEL := TYP_TABEL();
BEGIN
  LOOP
    LN := INSTR(LSTR, ';');
    EXIT WHEN(NVL(LN, 0) = 0);
    LDATA.EXTEND;
    LSTR2:=LTRIM(RTRIM(SUBSTR(LSTR, 1, LN - 1)));
    channel_id:=LTRIM(RTRIM(substr(LSTR2,1,instr(LSTR2,':')-1)));
    gw_type:=LTRIM(RTRIM(substr(substr(LSTR2,instr(LSTR2,':')+1),1,instr(substr(LSTR2,instr(LSTR2,':')+1),'-')-1)));
    send_quantity:=to_number(LTRIM((RTRIM((substr(LSTR2,instr(LSTR2,'-')+1))))));
    t_Object:=TYP_TABELTYPE(channel_id,gw_type,send_quantity);
    LDATA(LDATA.Count):= t_Object;
    LSTR := SUBSTR(LSTR, LN + 1);
  END LOOP;
  RETURN LDATA;
END FNC_CON_STR_TO_TAB;
/

prompt
prompt Creating function FUN_JXDATE
prompt ============================
prompt
create or replace function mc.FUN_JXDATE(p_date varchar2)
       return varchar2
is
       backDate varchar2(50);

       v_year varchar2(30);
       v_month varchar2(30);
       v_day varchar2(30);
begin

       v_year := SUBSTR(p_date, 0, 4 );
       v_month := SUBSTR(p_date, instr(p_date, '-',1,1) + 1, 2 );
       v_day := SUBSTR(p_date, instr(p_date, '-',-1,1)+1, 2);

       backDate := 'SEND_HIS_' || v_year || '_' || v_month || '_' || v_day;
       return backDate;
end FUN_JXDATE;
/

prompt
prompt Creating function FUN_JXMDATE
prompt =============================
prompt
create or replace function mc.FUN_JXMDATE(p_date varchar2)
       return varchar2
is
       backDate varchar2(50);

       v_year varchar2(30);
       v_month varchar2(30);
       v_day varchar2(30);
begin

       v_year := SUBSTR(p_date, 0, 4 );
       v_month := SUBSTR(p_date, instr(p_date, '-',1,1) + 1, 2 );
       v_day := SUBSTR(p_date, instr(p_date, '-',-1,1)+1, 2);

       backDate := 'MMS_SEND_HIS_' || v_year || '_' || v_month || '_' || v_day;
       return backDate;
end FUN_JXMDATE;
/

prompt
prompt Creating function ISNUMERIC
prompt ===========================
prompt
create or replace function mc.isnumeric    ( p_string in varchar2)
  return varchar2
  as
      l_number number;
  begin
     if p_string is null then
      return '�ܲ�';
     Elsif p_string = '' then
      return '�ܲ�';
     Else
       return p_string;
     end if;
  exception    when others then
          return '�ܲ�';
  end;
/

prompt
prompt Creating function TEST_CREATE_ROWID
prompt ===================================
prompt
create or replace function mc.test_create_rowId
return varchar2
is
row_id varchar2(100);
begin
  select to_char(sysdate,'yyyymmddhh24miss')||lpad(round(dbms_random.value(1,999999999)),9,0) into row_id from dual;
return row_id;
end;
/

prompt
prompt Creating procedure FEE_CALCULATE_ABLE
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE mc.FEE_CALCULATE_ABLE(P_USER_ID                 IN VARCHAR2,
                                               P_BIZ_TYPE                IN NUMBER,
                                               BATCH_ID                  IN VARCHAR2,
                                               SEND_TYPE                 IN NUMBER,
                                               SEND_MSG                  IN VARCHAR2,
                                               CHANNE_GW_QUANTIY_LIST    IN VARCHAR2,
                                               RUN_RESULT                OUT NUMBER,
                                               RUN_EXCEPTION             OUT VARCHAR,
                                               RUN_UNIT_PRICE            OUT VARCHAR,
                                               UPDATE_UNIT_PRICE_QUOTA   OUT VARCHAR) IS
  /**
    *���ͼƷ�
    * Author  : zxd
    * Created : 2013-6-10 16:24:35
    *
   **����˵����
   **���룺
    *     p_user_id             �û�����
    *     p_biz_type            ��Ϣ����  0:���� 1:����
    *     batch_id              ���κ�
    *     send_type             ��������  0:��ͨ����,1:��������,2:�ظ�����,3:Ⱥ�鷢��,4:socket����,5:webservice����,6:�ֹ�����,7:Ԥ������,8:�����ʾ�,9:����ף��,10:��ͨ����,11:�˵�����,20:��ͨemail
    *     send_msg              ��Ϣ����
    *     channe_gw_quantiy_list �������� ��ʽ: ͨ��:�Ŷ�-��������; ��: 12:1-200;  13:2-200; 12:3-200;
    *
   **�����
    *     run_result               ����״̬��0���Ʒѳɹ���1:������������ 2:�����Ķ������� 3:�û��������� 4:�û���������
    *                                        5:�Ƿ��Ķ������� 6:�û����� 7:�������� 8:�û������� 9:���������� 10:�û���������δ����Э���
                                             11:����δ֪�쳣
    *     run_exception            ���ش�����Ϣ
    *     RUN_UNIT_PRICE           ������Ϣ, ���� 1:0.05;2:0.06;3:0.06
    *     UPDATE_UNIT_PRICE_QUOTA   ����Э��۵�����,��ʽ: �Ŷ�:Э���-��������  ����  1:0.3-200; 1:0.4-200;  2:0.3-200; 3:0.3-200;
    *
   ** �㷨��
    *
  */
  QUANTIY_LIST_NO_FOUNDS EXCEPTION; --���ͨ��-�Ŷ�-�������쳣

  ILLEGALITY_BIZ_TYPE EXCEPTION; --�Ƿ������� ע:��֧�ֶ��źͲ�����������

  NO_ORG_RECORD EXCEPTION; --����������

  NO_USER_RECORD EXCEPTION; --�û�������

  NO_UNIT_PRICE EXCEPTION; --Э��۲�����

  NO_START_UNIT_PRICE EXCEPTION; --Э��ۻ�û�п�ʼ����

  ORG_NOT_SUFFICIENT_FUNDS EXCEPTION; --��������

  USER_NOT_SUFFICIENT_FUNDS EXCEPTION; --�û�����

  ORG_SMSQUOTA_NOT_ENOUGH EXCEPTION; --����������������

  ORG_MMSQUOTA_NOT_ENOUGH EXCEPTION; --����������������

  USER_SMSQUOTA_NOT_ENOUGH EXCEPTION; --�û�������������

  USER_MMSQUOTA_NOT_ENOUGH EXCEPTION; --�û�������������

  P_GW_TYPE VARCHAR2(200); --�Ŷ�����

  P_CHANNEL_ID VARCHAR2(200); --ͨ��ID

  P_SEND_QUANTITY NUMBER(10); --��������

  /*
  *CURSOR_CHANNEL_GW_QUANTITY �α� ͨ��FNC_CON_STR_TO_TAB�������
  */
  CURSOR CURSOR_CHANNEL_GW_QUANTITY IS
    SELECT * FROM TABLE(FNC_CON_STR_TO_TAB(CHANNE_GW_QUANTIY_LIST));

  ORG_DATA ORGANIZATION%ROWTYPE; --������Ϣ

  USER_DATA USER_INFO%ROWTYPE; --�û���Ϣ

  P_UNIT_PRICE UNIT_PRICE_INFO.UNIT_PRICE%TYPE; --����Э���

  P_PRICE_START UNIT_PRICE_INFO.START_DATE%TYPE; --����Э��ۿ�ʼʱ��

  COST_FEE NUMBER(10, 3); --���ζ��ŷ���

  REMAIN_BALANCE NUMBER(10, 3); --ʣ����

  REMAIN_QUOTA CONSUME_RECORD_INFO.REMAIN_QUOTA%TYPE; --ʣ�����

  QUANTITY_RESULT NUMBER(10); --��ֺ��¼��

  v_payMode organization.pay_mode%type;
  v_unitprice org_remain_balance.unit_price%type;
  v_extraQuota organization.user_quota%type; --�ӻ������û���ֵ����ֵ����-��ǰЭ������ �����
  v_lastQuota organization.user_quota%type;  --ʱ�������һ�����

BEGIN

  RUN_UNIT_PRICE := NULL;
  UPDATE_UNIT_PRICE_QUOTA :='';

  SELECT COUNT(*)
    INTO QUANTITY_RESULT
    FROM TABLE(FNC_CON_STR_TO_TAB(CHANNE_GW_QUANTIY_LIST)); --����Ƿ��ֳɹ�
  IF QUANTITY_RESULT = 0 THEN
    RAISE QUANTIY_LIST_NO_FOUNDS;
  END IF;

  IF CURSOR_CHANNEL_GW_QUANTITY%ISOPEN THEN
    --��ֹ�ϴ��α��û�ر�
    CLOSE CURSOR_CHANNEL_GW_QUANTITY;
  END IF;
  DBMS_OUTPUT.PUT_LINE('============��ʼ�Ʒ�==========');
  OPEN CURSOR_CHANNEL_GW_QUANTITY;
  LOOP
   SELECT U.* INTO USER_DATA FROM USER_INFO U WHERE U.USER_ID = P_USER_ID;
    IF USER_DATA.USER_ID IS NULL THEN
      RAISE NO_USER_RECORD; --�û�������ʱ�׳��쳣
    ELSE
      SELECT O.*
        INTO ORG_DATA
        FROM ORGANIZATION O
       WHERE O.USER_ID = USER_DATA.ORGANIZATION_ID;
      IF ORG_DATA.USER_ID IS NULL THEN
        RAISE NO_ORG_RECORD; --����������ʱ�׳��쳣
      END IF;
    END IF;
    FETCH CURSOR_CHANNEL_GW_QUANTITY
      INTO P_CHANNEL_ID, P_GW_TYPE, P_SEND_QUANTITY;
    EXIT WHEN CURSOR_CHANNEL_GW_QUANTITY%NOTFOUND;

 --   UPDATE_UNIT_PRICE_QUOTA := P_GW_TYPE||':';

    IF ORG_DATA.PAY_TYPE = 1 THEN
      DBMS_OUTPUT.PUT_LINE('�û����ڻ������ں󸶷�,��ִ�мƷѲ���'); --�����Ǻ󸶷�ʱ��ִ�мƷѲ���ֻ��¼��ˮ
      --��¼��ˮ
      BEGIN
      --����������������ͻ����ѯ����������Э���
      IF ORG_DATA.PARENTID != '0' and ORG_DATA.PARENTID != '1' THEN
      SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э���
      ELSE
      --����������ڷ������ͻ����ѯ��ǰ������Э���
      SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э���
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE NO_UNIT_PRICE;
      END;

      IF P_PRICE_START > SYSDATE THEN
          RAISE NO_START_UNIT_PRICE;  --Э��ۻ�û�п�ʼ����
      END IF;

      --���쵥�۵��ַ���
      IF RUN_UNIT_PRICE IS NULL OR LENGTH(RUN_UNIT_PRICE) = 0 THEN
        RUN_UNIT_PRICE := P_GW_TYPE || ':' || P_UNIT_PRICE;
      ELSE
        RUN_UNIT_PRICE := RUN_UNIT_PRICE || ';' || P_GW_TYPE || ':' ||
                          P_UNIT_PRICE;
      END IF;

      COST_FEE := P_SEND_QUANTITY * P_UNIT_PRICE; --����������(����/����)����
      INSERT INTO CONSUME_RECORD_INFO
        (RECORD_ID,
         CONSUMER_ID,
         CONSUMER_NAME,
         SEND_QUANTITY,
         BIZ_TYPE,
         BATCH_ID,
         COST_FEE,
         SEND_MSG,
         SEND_TYPE,
         UNIT_PRICE,
         CHANNEL_ID,
         GW_TYPE,
         FEE_MODE,
         ORGANIZATION_ID,
         PAY_TYPE)
      VALUES
        (SYS_GUID(),
         USER_DATA.USER_ID,
         USER_DATA.USER_NAME,
         P_SEND_QUANTITY,
         P_BIZ_TYPE,
         BATCH_ID,
         COST_FEE,
         decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
         SEND_TYPE,
         P_UNIT_PRICE,
         P_CHANNEL_ID,
         P_GW_TYPE,
         ORG_DATA.FEE_MODE,
         ORG_DATA.USER_ID,
         ORG_DATA.PAY_TYPE);
    ELSE
      --�û�����Ԥ����
     BEGIN
      --����������������ͻ����ѯ����������Э���
      IF ORG_DATA.PARENTID != '0' and ORG_DATA.PARENTID != '1' THEN
       SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э���
      ELSE
      --����������ڷ������ͻ����ѯ��ǰ������Э���
      SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э���
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE NO_UNIT_PRICE;
      END;

      IF P_PRICE_START> SYSDATE THEN
          RAISE NO_START_UNIT_PRICE;  --Э��ۻ�û�п�ʼ����
      END IF;

      --���쵥�۵��ַ���
      IF RUN_UNIT_PRICE IS NULL OR LENGTH(RUN_UNIT_PRICE) = 0 THEN
        RUN_UNIT_PRICE := P_GW_TYPE || ':' || P_UNIT_PRICE;
      ELSE
        RUN_UNIT_PRICE := RUN_UNIT_PRICE || ';' || P_GW_TYPE || ':' ||
                          P_UNIT_PRICE;
      END IF;

      IF ORG_DATA.PAY_MODE = 1 THEN
        -- ��������ǽ���
        COST_FEE := P_SEND_QUANTITY * P_UNIT_PRICE; --����������(����/����)����
        IF ORG_DATA.FEE_MODE = 1 THEN
          --�û������鸶��
          IF ORG_DATA.USER_BALANCE < COST_FEE THEN
            --��������
            RAISE ORG_NOT_SUFFICIENT_FUNDS;
          END IF;
          REMAIN_BALANCE := ORG_DATA.USER_BALANCE - COST_FEE; --�۷Ѻ�������
          UPDATE ORGANIZATION O
             SET O.USER_BALANCE = REMAIN_BALANCE
           WHERE O.USER_ID = ORG_DATA.USER_ID; --���»������

          --��¼��ˮ
          INSERT INTO CONSUME_RECORD_INFO
            (RECORD_ID,
             CONSUMER_ID,
             CONSUMER_NAME,
             SEND_QUANTITY,
             BIZ_TYPE,
             BATCH_ID,
             COST_FEE,
             SEND_MSG,
             SEND_TYPE,
             UNIT_PRICE,
             CHANNEL_ID,
             GW_TYPE,
             FEE_MODE,
             ORGANIZATION_ID,
             PAY_TYPE,
             REMAIN_BALANCE)
          VALUES
            (SYS_GUID(),
             USER_DATA.USER_ID,
             USER_DATA.USER_NAME,
             P_SEND_QUANTITY,
             P_BIZ_TYPE,
             BATCH_ID,
             COST_FEE,
             decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
             SEND_TYPE,
             P_UNIT_PRICE,
             P_CHANNEL_ID,
             P_GW_TYPE,
             ORG_DATA.FEE_MODE,
             ORG_DATA.USER_ID,
             ORG_DATA.PAY_TYPE,
             REMAIN_BALANCE);
        ELSE
        --�����Ը���
          IF P_BIZ_TYPE = 0 THEN
            --����Ϊ����
            IF USER_DATA.USER_QUOTA < P_SEND_QUANTITY THEN
              RAISE USER_SMSQUOTA_NOT_ENOUGH; --�û�������������
            END IF;
            REMAIN_QUOTA := USER_DATA.USER_QUOTA - P_SEND_QUANTITY;
            UPDATE USER_INFO U
               SET U.USER_QUOTA = REMAIN_QUOTA
             WHERE U.USER_ID = P_USER_ID; --�����û���������
           --����Ը����û��۳�����
            begin
              --��ѯ�û�����������Э���������ӻ������
              select orb.sms_quota, orb.unit_price
                into v_lastQuota, v_unitprice
                from org_remain_balance orb
               where orb.status = 1
                 and orb.user_id = P_USER_ID
                 and orb.update_unitprice_date =
                     (select min(orb2.update_unitprice_date) from org_remain_balance orb2
                       where orb2.user_id = P_USER_ID
                         and orb2.status = 1
                         and orb2.sms_quota > 0);
              v_extraQuota := P_SEND_QUANTITY;
              if P_SEND_QUANTITY <= v_lastQuota then
                  /* �۷Ѷ�������Э������С���۳���Ӧ���û���� */
                  update org_remain_balance orb
                  set orb.sms_quota = orb.sms_quota - P_SEND_QUANTITY, orb.last_update_quota_date =sysdate
                  where orb.user_id = P_USER_ID
                  and orb.status=1
                  and orb.unit_price=v_unitprice;
                  --����Э��ۺ�����  ���� 0.3:5
                  UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||P_SEND_QUANTITY||';';
                  DBMS_OUTPUT.PUT_LINE('UPDATE_UNIT_PRICE_QUOTA='||UPDATE_UNIT_PRICE_QUOTA);
                  --��¼��ˮ
                  INSERT INTO CONSUME_RECORD_INFO
                    (RECORD_ID,
                     CONSUMER_ID,
                     CONSUMER_NAME,
                     SEND_QUANTITY,
                     BIZ_TYPE,
                     BATCH_ID,
                     COST_FEE,
                     SEND_MSG,
                     SEND_TYPE,
                     UNIT_PRICE,
                     CHANNEL_ID,
                     GW_TYPE,
                     FEE_MODE,
                     ORGANIZATION_ID,
                     PAY_TYPE,
                     REMAIN_BALANCE)
                  VALUES
                    (SYS_GUID(),
                     USER_DATA.USER_ID,
                     USER_DATA.USER_NAME,
                     P_SEND_QUANTITY,
                     P_BIZ_TYPE,
                     BATCH_ID,
                     COST_FEE,
                     decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                     SEND_TYPE,
                     v_unitprice,
                     P_CHANNEL_ID,
                     P_GW_TYPE,
                     ORG_DATA.FEE_MODE,
                     ORG_DATA.USER_ID,
                     ORG_DATA.PAY_TYPE,
                     REMAIN_BALANCE);
              elsif P_SEND_QUANTITY > v_lastQuota then
                  loop
                      --��ѯ�û�����������Э���������ӻ������
                      select orb.sms_quota, orb.unit_price
                        into v_lastQuota, v_unitprice
                        from org_remain_balance orb
                       where orb.status = 1
                         and orb.user_id = P_USER_ID
                         and orb.update_unitprice_date =
                             (select min(orb2.update_unitprice_date)
                                from org_remain_balance orb2
                               where orb2.user_id = P_USER_ID
                                 and orb2.status = 1
                                 and orb2.sms_quota > 0);
                      --��ʱ�������һ��Э�����ʼ��
                      v_extraQuota := v_extraQuota - v_lastQuota;
                      --����۷Ѷ����һ��Э��ۻ���
                      if v_extraQuota >=0 then
                       /* ��һ��Э��۵����ȿ۷Ѷ�С���û���������� */
                            update org_remain_balance orb
                            set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                            where orb.user_id = P_USER_ID
                            and orb.status=1
                            and orb.unit_price=v_unitprice;
                            --����Э��ۺ�����  ���� 0.3:5
                            UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||v_lastQuota||';';
                            --��¼��ˮ
                            INSERT INTO CONSUME_RECORD_INFO
                              (RECORD_ID,
                               CONSUMER_ID,
                               CONSUMER_NAME,
                               SEND_QUANTITY,
                               BIZ_TYPE,
                               BATCH_ID,
                               COST_FEE,
                               SEND_MSG,
                               SEND_TYPE,
                               UNIT_PRICE,
                               CHANNEL_ID,
                               GW_TYPE,
                               FEE_MODE,
                               ORGANIZATION_ID,
                               PAY_TYPE,
                               REMAIN_BALANCE)
                            VALUES
                              (SYS_GUID(),
                               USER_DATA.USER_ID,
                               USER_DATA.USER_NAME,
                               v_lastQuota,
                               P_BIZ_TYPE,
                               BATCH_ID,
                               COST_FEE,
                               decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                               SEND_TYPE,
                               v_unitprice,
                               P_CHANNEL_ID,
                               P_GW_TYPE,
                               ORG_DATA.FEE_MODE,
                               ORG_DATA.USER_ID,
                               ORG_DATA.PAY_TYPE,
                               REMAIN_BALANCE);

                       --�۷Ѷ����һ�������Э������С
                      elsif v_extraQuota <0 then
                          /* �۷Ѷ�������Э������С���۳���Ӧ���û���� */
                          update org_remain_balance orb
                          set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                          where orb.user_id = P_USER_ID
                          and orb.status=1
                          and orb.unit_price=v_unitprice;

                          --����Э��ۺ�����  ���� 0.3:5
                            UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'|| v_unitprice||'-'||(v_lastQuota+v_extraQuota)||';';
                            --��¼��ˮ
                            INSERT INTO CONSUME_RECORD_INFO
                              (RECORD_ID,
                               CONSUMER_ID,
                               CONSUMER_NAME,
                               SEND_QUANTITY,
                               BIZ_TYPE,
                               BATCH_ID,
                               COST_FEE,
                               SEND_MSG,
                               SEND_TYPE,
                               UNIT_PRICE,
                               CHANNEL_ID,
                               GW_TYPE,
                               FEE_MODE,
                               ORGANIZATION_ID,
                               PAY_TYPE,
                               REMAIN_BALANCE)
                            VALUES
                              (SYS_GUID(),
                               USER_DATA.USER_ID,
                               USER_DATA.USER_NAME,
                               (v_lastQuota+v_extraQuota),
                               P_BIZ_TYPE,
                               BATCH_ID,
                               COST_FEE,
                               decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                               SEND_TYPE,
                               v_unitprice,
                               P_CHANNEL_ID,
                               P_GW_TYPE,
                               ORG_DATA.FEE_MODE,
                               ORG_DATA.USER_ID,
                               ORG_DATA.PAY_TYPE,
                               REMAIN_BALANCE);
                      end if;

                      exit when v_extraQuota <=0;
                  end loop;
              end if;
            end;
          ELSIF P_BIZ_TYPE = 1 THEN
            --����Ϊ����
            IF USER_DATA.MMS_QUOTA < P_SEND_QUANTITY THEN
              RAISE USER_MMSQUOTA_NOT_ENOUGH; --�û�������������
            END IF;
            REMAIN_QUOTA := USER_DATA.MMS_QUOTA - P_SEND_QUANTITY;
            UPDATE USER_INFO U
               SET U.MMS_QUOTA = REMAIN_QUOTA
             WHERE U.USER_ID = P_USER_ID; --�����û���������
          END IF;
        END IF;

      ELSE
        --����������
        IF ORG_DATA.FEE_MODE = 1 THEN
          --�û������鸶��
          IF P_BIZ_TYPE = 0 THEN
            --����Ϊ����
            IF ORG_DATA.USER_QUOTA < P_SEND_QUANTITY THEN
              RAISE ORG_SMSQUOTA_NOT_ENOUGH; --����������������
            END IF;
            REMAIN_QUOTA := ORG_DATA.USER_QUOTA - P_SEND_QUANTITY;
            UPDATE ORGANIZATION O
               SET O.USER_QUOTA = REMAIN_QUOTA
             WHERE O.USER_ID = ORG_DATA.USER_ID; --���»�����������
          ELSIF P_BIZ_TYPE = 1 THEN
            --����Ϊ����
            IF ORG_DATA.MMS_QUOTA < P_SEND_QUANTITY THEN
              RAISE ORG_MMSQUOTA_NOT_ENOUGH; --����������������
            END IF;
            REMAIN_QUOTA := ORG_DATA.MMS_QUOTA - P_SEND_QUANTITY;
            UPDATE ORGANIZATION O
               SET O.MMS_QUOTA = REMAIN_QUOTA
             WHERE O.USER_ID = ORG_DATA.USER_ID; --���»�����������
          END IF;
          /*���ǽ���������ӻ������޸�����*/
          IF ORG_DATA.PARENTID !='0' AND ORG_DATA.PARENTID !='1' THEN
             --��ѯ�����ǽ��/����
             SELECT O.PAY_MODE INTO v_payMode FROM ORGANIZATION O WHERE O.USER_ID=ORG_DATA.PARENTID;
             if v_payMode=1 then
                 begin
                    --��ѯ�û�����������Э���������ӻ������
                    select orb.sms_quota, orb.unit_price
                      into v_lastQuota, v_unitprice
                      from org_remain_balance orb
                     where orb.status = 1
                       and orb.user_id = ORG_DATA.USER_ID
                       and orb.update_unitprice_date =
                           (select min(orb2.update_unitprice_date) from org_remain_balance orb2
                             where orb2.user_id = ORG_DATA.USER_ID
                               and orb2.status = 1
                               and orb2.sms_quota > 0);
                    v_extraQuota := P_SEND_QUANTITY;
                    if P_SEND_QUANTITY <= v_lastQuota then
                        /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                        update org_remain_balance orb
                        set orb.sms_quota = orb.sms_quota - P_SEND_QUANTITY, orb.last_update_quota_date =sysdate
                        where orb.user_id = ORG_DATA.USER_ID
                        and orb.status=1
                        and orb.unit_price=v_unitprice;
                        --����Э��ۺ�����  ���� 0.3:5
                        UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||P_SEND_QUANTITY||';';
                        INSERT INTO CONSUME_RECORD_INFO
                          (RECORD_ID,
                           CONSUMER_ID,
                           CONSUMER_NAME,
                           SEND_QUANTITY,
                           BIZ_TYPE,
                           BATCH_ID,
                           COST_FEE,
                           SEND_MSG,
                           SEND_TYPE,
                           UNIT_PRICE,
                           CHANNEL_ID,
                           GW_TYPE,
                           FEE_MODE,
                           ORGANIZATION_ID,
                           PAY_TYPE,
                           REMAIN_BALANCE)
                        VALUES
                          (SYS_GUID(),
                           USER_DATA.USER_ID,
                           USER_DATA.USER_NAME,
                           P_SEND_QUANTITY,
                           P_BIZ_TYPE,
                           BATCH_ID,
                           COST_FEE,
                           decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                           SEND_TYPE,
                           v_unitprice,
                           P_CHANNEL_ID,
                           P_GW_TYPE,
                           ORG_DATA.FEE_MODE,
                           ORG_DATA.USER_ID,
                           ORG_DATA.PAY_TYPE,
                           REMAIN_BALANCE);
                    elsif P_SEND_QUANTITY > v_lastQuota then
                        loop
                            --��ѯ�û�����������Э���������ӻ������
                            select orb.sms_quota, orb.unit_price
                              into v_lastQuota, v_unitprice
                              from org_remain_balance orb
                             where orb.status = 1
                               and orb.user_id = ORG_DATA.USER_ID
                               and orb.update_unitprice_date =
                                   (select min(orb2.update_unitprice_date)
                                      from org_remain_balance orb2
                                     where orb2.user_id = ORG_DATA.USER_ID
                                       and orb2.status = 1
                                       and orb2.sms_quota > 0);
                            --��ʱ�������һ��Э�����ʼ��
                            v_extraQuota := v_extraQuota - v_lastQuota;
                            --�����ֵ�����һ��Э��ۻ���
                            if v_extraQuota >=0 then
                             /* ��һ��Э��۵����ȳ�ֵ��С���û���������� */
                                  update org_remain_balance orb
                                  set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                                  where orb.user_id = ORG_DATA.USER_ID
                                  and orb.status=1
                                  and orb.unit_price=v_unitprice;
                                  --����Э��ۺ�����  ���� 0.3:5
                                  UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||v_lastQuota||';';
                                  INSERT INTO CONSUME_RECORD_INFO
                                  (RECORD_ID,
                                   CONSUMER_ID,
                                   CONSUMER_NAME,
                                   SEND_QUANTITY,
                                   BIZ_TYPE,
                                   BATCH_ID,
                                   COST_FEE,
                                   SEND_MSG,
                                   SEND_TYPE,
                                   UNIT_PRICE,
                                   CHANNEL_ID,
                                   GW_TYPE,
                                   FEE_MODE,
                                   ORGANIZATION_ID,
                                   PAY_TYPE,
                                   REMAIN_BALANCE)
                                VALUES
                                  (SYS_GUID(),
                                   USER_DATA.USER_ID,
                                   USER_DATA.USER_NAME,
                                   v_lastQuota,
                                   P_BIZ_TYPE,
                                   BATCH_ID,
                                   COST_FEE,
                                   decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                                   SEND_TYPE,
                                   v_unitprice,
                                   P_CHANNEL_ID,
                                   P_GW_TYPE,
                                   ORG_DATA.FEE_MODE,
                                   ORG_DATA.USER_ID,
                                   ORG_DATA.PAY_TYPE,
                                   REMAIN_BALANCE);
                             --��ֵ�����һ�������Э������С
                            elsif v_extraQuota <0 then
                                /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                                update org_remain_balance orb
                                set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                                where orb.user_id = ORG_DATA.USER_ID
                                and orb.status=1
                                and orb.unit_price=v_unitprice;

                                --����Э��ۺ�����  ���� 0.3:5
                                UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'|| v_unitprice||'-'||(v_lastQuota+v_extraQuota)||';';
                                --��¼��ˮ
                                INSERT INTO CONSUME_RECORD_INFO
                                  (RECORD_ID,
                                   CONSUMER_ID,
                                   CONSUMER_NAME,
                                   SEND_QUANTITY,
                                   BIZ_TYPE,
                                   BATCH_ID,
                                   COST_FEE,
                                   SEND_MSG,
                                   SEND_TYPE,
                                   UNIT_PRICE,
                                   CHANNEL_ID,
                                   GW_TYPE,
                                   FEE_MODE,
                                   ORGANIZATION_ID,
                                   PAY_TYPE,
                                   REMAIN_BALANCE)
                                VALUES
                                  (SYS_GUID(),
                                   USER_DATA.USER_ID,
                                   USER_DATA.USER_NAME,
                                   (v_lastQuota+v_extraQuota),
                                   P_BIZ_TYPE,
                                   BATCH_ID,
                                   COST_FEE,
                                   decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                                   SEND_TYPE,
                                   v_unitprice,
                                   P_CHANNEL_ID,
                                   P_GW_TYPE,
                                   ORG_DATA.FEE_MODE,
                                   ORG_DATA.USER_ID,
                                   ORG_DATA.PAY_TYPE,
                                   REMAIN_BALANCE);
                            end if;

                            exit when v_extraQuota <=0;
                        end loop;
                    end if;
                end;
             end if;
          END IF;
        ELSE
          --�������Ը���
          IF P_BIZ_TYPE = 0 THEN
            --����Ϊ����
            IF USER_DATA.USER_QUOTA < P_SEND_QUANTITY THEN
              RAISE USER_SMSQUOTA_NOT_ENOUGH; --�û�������������
            END IF;
            REMAIN_QUOTA := USER_DATA.USER_QUOTA - P_SEND_QUANTITY;
            UPDATE USER_INFO U
               SET U.USER_QUOTA = REMAIN_QUOTA
             WHERE U.USER_ID = P_USER_ID; --�����û���������
          ELSIF P_BIZ_TYPE = 1 THEN
            --����Ϊ����
            IF USER_DATA.MMS_QUOTA < P_SEND_QUANTITY THEN
              RAISE USER_MMSQUOTA_NOT_ENOUGH; --�û�������������
            END IF;
            REMAIN_QUOTA := USER_DATA.MMS_QUOTA - P_SEND_QUANTITY;
            UPDATE USER_INFO U
               SET U.MMS_QUOTA = REMAIN_QUOTA
             WHERE U.USER_ID = P_USER_ID; --�����û���������
          END IF;
          --��������ӻ������Ը����û����޸�����
          SELECT o.pay_mode into v_payMode
          FROM organization o
          where o.parentid='1'
          START WITH o.user_id=(select u.organization_id from user_info u where u.user_id=P_USER_ID)
          CONNECT BY PRIOR o.parentid=o.user_id;
          if v_payMode=1 then
             begin
                    --��ѯ�û�����������Э���������ӻ������
                    select orb.sms_quota, orb.unit_price
                      into v_lastQuota, v_unitprice
                      from org_remain_balance orb
                     where orb.status = 1
                       and orb.user_id = P_USER_ID
                       and orb.update_unitprice_date =
                           (select min(orb2.update_unitprice_date) from org_remain_balance orb2
                             where orb2.user_id = P_USER_ID
                               and orb2.status = 1
                               and orb2.sms_quota > 0);
                    v_extraQuota := P_SEND_QUANTITY;
                    if P_SEND_QUANTITY <= v_lastQuota then
                        /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                        update org_remain_balance orb
                        set orb.sms_quota = orb.sms_quota - P_SEND_QUANTITY, orb.last_update_quota_date =sysdate
                        where orb.user_id = P_USER_ID
                        and orb.status=1
                        and orb.unit_price=v_unitprice;
                        --����Э��ۺ�����  ���� 0.3:5
                        UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||P_SEND_QUANTITY||';';
                        INSERT INTO CONSUME_RECORD_INFO
                            (RECORD_ID,
                             CONSUMER_ID,
                             CONSUMER_NAME,
                             SEND_QUANTITY,
                             BIZ_TYPE,
                             BATCH_ID,
                             COST_FEE,
                             SEND_MSG,
                             SEND_TYPE,
                             UNIT_PRICE,
                             CHANNEL_ID,
                             GW_TYPE,
                             FEE_MODE,
                             ORGANIZATION_ID,
                             PAY_TYPE,
                             REMAIN_BALANCE)
                          VALUES
                            (SYS_GUID(),
                             USER_DATA.USER_ID,
                             USER_DATA.USER_NAME,
                             P_SEND_QUANTITY,
                             P_BIZ_TYPE,
                             BATCH_ID,
                             COST_FEE,
                             decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                             SEND_TYPE,
                             v_unitprice,
                             P_CHANNEL_ID,
                             P_GW_TYPE,
                             ORG_DATA.FEE_MODE,
                             ORG_DATA.USER_ID,
                             ORG_DATA.PAY_TYPE,
                             REMAIN_BALANCE);
                    elsif P_SEND_QUANTITY > v_lastQuota then
                        loop
                            --��ѯ�û�����������Э���������ӻ������
                            select orb.sms_quota, orb.unit_price
                              into v_lastQuota, v_unitprice
                              from org_remain_balance orb
                             where orb.status = 1
                               and orb.user_id = P_USER_ID
                               and orb.update_unitprice_date =
                                   (select min(orb2.update_unitprice_date)
                                      from org_remain_balance orb2
                                     where orb2.user_id = P_USER_ID
                                       and orb2.status = 1
                                       and orb2.sms_quota > 0);
                            --��ʱ�������һ��Э�����ʼ��
                            v_extraQuota := v_extraQuota - v_lastQuota;
                            --�����ֵ�����һ��Э��ۻ���
                            if v_extraQuota >=0 then
                             /* ��һ��Э��۵����ȳ�ֵ��С���û���������� */
                                  update org_remain_balance orb
                                  set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                                  where orb.user_id = P_USER_ID
                                  and orb.status=1
                                  and orb.unit_price=v_unitprice;
                                  --����Э��ۺ�����  ���� 0.3:5
                                  UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||v_lastQuota||';';
                                  INSERT INTO CONSUME_RECORD_INFO
                                  (RECORD_ID,
                                   CONSUMER_ID,
                                   CONSUMER_NAME,
                                   SEND_QUANTITY,
                                   BIZ_TYPE,
                                   BATCH_ID,
                                   COST_FEE,
                                   SEND_MSG,
                                   SEND_TYPE,
                                   UNIT_PRICE,
                                   CHANNEL_ID,
                                   GW_TYPE,
                                   FEE_MODE,
                                   ORGANIZATION_ID,
                                   PAY_TYPE,
                                   REMAIN_BALANCE)
                                VALUES
                                  (SYS_GUID(),
                                   USER_DATA.USER_ID,
                                   USER_DATA.USER_NAME,
                                   v_lastQuota,
                                   P_BIZ_TYPE,
                                   BATCH_ID,
                                   COST_FEE,
                                   decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                                   SEND_TYPE,
                                   v_unitprice,
                                   P_CHANNEL_ID,
                                   P_GW_TYPE,
                                   ORG_DATA.FEE_MODE,
                                   ORG_DATA.USER_ID,
                                   ORG_DATA.PAY_TYPE,
                                   REMAIN_BALANCE);
                             --��ֵ�����һ�������Э������С
                            elsif v_extraQuota <0 then
                                /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                                update org_remain_balance orb
                                set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                                where orb.user_id = P_USER_ID
                                and orb.status=1
                                and orb.unit_price=v_unitprice;
                                --����Э��ۺ�����  ���� 0.3:5
                                UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||(v_lastQuota+v_extraQuota)||';';
                                INSERT INTO CONSUME_RECORD_INFO
                                (RECORD_ID,
                                 CONSUMER_ID,
                                 CONSUMER_NAME,
                                 SEND_QUANTITY,
                                 BIZ_TYPE,
                                 BATCH_ID,
                                 COST_FEE,
                                 SEND_MSG,
                                 SEND_TYPE,
                                 UNIT_PRICE,
                                 CHANNEL_ID,
                                 GW_TYPE,
                                 FEE_MODE,
                                 ORGANIZATION_ID,
                                 PAY_TYPE,
                                 REMAIN_BALANCE)
                              VALUES
                                (SYS_GUID(),
                                 USER_DATA.USER_ID,
                                 USER_DATA.USER_NAME,
                                 (v_lastQuota+v_extraQuota),
                                 P_BIZ_TYPE,
                                 BATCH_ID,
                                 COST_FEE,
                                 decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                                 SEND_TYPE,
                                 v_unitprice,
                                 P_CHANNEL_ID,
                                 P_GW_TYPE,
                                 ORG_DATA.FEE_MODE,
                                 ORG_DATA.USER_ID,
                                 ORG_DATA.PAY_TYPE,
                                 REMAIN_BALANCE);
                            end if;

                            exit when v_extraQuota <=0;
                        end loop;
                    end if;
                end;
          end if;

        END IF;

        if ORG_DATA.Parentid='0' then
           INSERT INTO CONSUME_RECORD_INFO
            (RECORD_ID,
             CONSUMER_ID,
             CONSUMER_NAME,
             SEND_QUANTITY,
             BIZ_TYPE,
             BATCH_ID,
             SEND_MSG,
             SEND_TYPE,
             UNIT_PRICE,
             CHANNEL_ID,
             GW_TYPE,
             FEE_MODE,
             ORGANIZATION_ID,
             PAY_TYPE,
             REMAIN_QUOTA)
          VALUES
            (SYS_GUID(),
             USER_DATA.USER_ID,
             USER_DATA.USER_NAME,
             P_SEND_QUANTITY,
             P_BIZ_TYPE,
             BATCH_ID,
             decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
             SEND_TYPE,
             P_UNIT_PRICE,
             P_CHANNEL_ID,
             P_GW_TYPE,
             ORG_DATA.FEE_MODE,
             ORG_DATA.USER_ID,
             ORG_DATA.PAY_TYPE,
             REMAIN_QUOTA);
        else
            SELECT o.pay_mode into v_payMode
            FROM organization o
            where o.parentid='1'
            START WITH o.user_id=(select u.organization_id from user_info u where u.user_id=P_USER_ID)
            CONNECT BY PRIOR o.parentid=o.user_id;

            if v_payMode=0 then
               INSERT INTO CONSUME_RECORD_INFO
                (RECORD_ID,
                 CONSUMER_ID,
                 CONSUMER_NAME,
                 SEND_QUANTITY,
                 BIZ_TYPE,
                 BATCH_ID,
                 SEND_MSG,
                 SEND_TYPE,
                 UNIT_PRICE,
                 CHANNEL_ID,
                 GW_TYPE,
                 FEE_MODE,
                 ORGANIZATION_ID,
                 PAY_TYPE,
                 REMAIN_QUOTA)
              VALUES
                (SYS_GUID(),
                 USER_DATA.USER_ID,
                 USER_DATA.USER_NAME,
                 P_SEND_QUANTITY,
                 P_BIZ_TYPE,
                 BATCH_ID,
                 decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                 SEND_TYPE,
                 P_UNIT_PRICE,
                 P_CHANNEL_ID,
                 P_GW_TYPE,
                 ORG_DATA.FEE_MODE,
                 ORG_DATA.USER_ID,
                 ORG_DATA.PAY_TYPE,
                 REMAIN_QUOTA);
            end if;
        end if;

      END IF;
    END IF;
  END LOOP;
  COMMIT;
  RUN_RESULT    := 0;
  RUN_EXCEPTION := '�Ʒѳɹ�';

  DBMS_OUTPUT.PUT_LINE('============�Ʒѳɹ�==========');
EXCEPTION
  WHEN ORG_MMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('������������');
    RUN_RESULT    := 1;
    RUN_EXCEPTION := '������������';
    ROLLBACK;
  WHEN ORG_SMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('�����Ķ�������');
    RUN_RESULT    := 2;
    RUN_EXCEPTION := '�����Ķ�������';
    ROLLBACK;
  WHEN USER_SMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('�û���������');
    RUN_RESULT    := 3;
    RUN_EXCEPTION := '�û���������';
    ROLLBACK;
  WHEN USER_MMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('�û���������');
    RUN_RESULT    := 4;
    RUN_EXCEPTION := '�û���������';
    ROLLBACK;
  WHEN ILLEGALITY_BIZ_TYPE THEN
    DBMS_OUTPUT.PUT_LINE('�Ƿ��Ķ�������');
    RUN_RESULT    := 5;
    RUN_EXCEPTION := '�Ƿ��Ķ�������';
    ROLLBACK;
  WHEN USER_NOT_SUFFICIENT_FUNDS THEN
    DBMS_OUTPUT.PUT_LINE('�û�����');
    RUN_RESULT    := 6;
    RUN_EXCEPTION := '�û�����';
    ROLLBACK;
  WHEN ORG_NOT_SUFFICIENT_FUNDS THEN
    DBMS_OUTPUT.PUT_LINE('��������');
    RUN_RESULT    := 7;
    RUN_EXCEPTION := '��������';
    ROLLBACK;
  WHEN NO_USER_RECORD THEN
    DBMS_OUTPUT.PUT_LINE('�ƷѴ�����ʾ:�û�������!');
    RUN_RESULT    := 8;
    RUN_EXCEPTION := '�ƷѴ�����ʾ:�û�������!';
    ROLLBACK;
  WHEN NO_ORG_RECORD THEN
    DBMS_OUTPUT.PUT_LINE('�ƷѴ�����ʾ:�û������Ļ���������!');
    RUN_RESULT    := 9;
    RUN_EXCEPTION := '�ƷѴ�����ʾ:�û������Ļ���������!';
    ROLLBACK;
  WHEN NO_UNIT_PRICE THEN
    DBMS_OUTPUT.PUT_LINE('�û���������δ����Э���');
    RUN_RESULT    := 10;
    RUN_EXCEPTION := '�û���������δ����Э���';
    ROLLBACK;
  WHEN QUANTIY_LIST_NO_FOUNDS THEN
    DBMS_OUTPUT.PUT_LINE('ͨ��-�Ŷ�-���������ʧ��,�����ʽ');
    RUN_RESULT    := 12;
    RUN_EXCEPTION := 'ͨ��-�Ŷ�-���������ʧ��,�����ʽ';
    ROLLBACK;
  WHEN NO_START_UNIT_PRICE THEN
    DBMS_OUTPUT.PUT_LINE('�û�����������Э��ۻ�û������ʱ��');
    RUN_RESULT    := 13;
    RUN_EXCEPTION := '�û�����������Э��ۻ�û������ʱ��';
    ROLLBACK;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE || '----' || SQLERRM);
    RUN_RESULT    := 11;
    RUN_EXCEPTION := SQLCODE || '----' || SQLERRM;
    ROLLBACK;
END FEE_CALCULATE_ABLE;
/

prompt
prompt Creating procedure INSERT_ALL_ORG_QUOTA
prompt =======================================
prompt
create or replace procedure mc.insert_all_org_quota
 is
 /*��ʼ�����������з����������û���������������*/
  --�α꣺��ѯ�û����
    cursor c_user is
        select u.user_id, u.user_quota,u.mms_quota,
        (SELECT up.unit_price
          FROM organization o
          left join unit_price_info up on up.organization_id=o.user_id
          where o.parentid='1'
          and up.effective=0
          and up.biz_type=0
          START WITH o.user_id=(select u2.organization_id from user_info u2 where u2.user_id=u.user_id)
          CONNECT BY PRIOR o.parentid=o.user_id) unit_price
        from user_info u
        left join organization o on o.user_id = u.organization_id
        where 1= (SELECT o.pay_mode
                FROM organization o
                where o.parentid='1' and o.pay_type=0
                START WITH o.user_id=u.organization_id
                CONNECT BY PRIOR o.parentid=o.user_id);
    --�α꣺��ѯ��������ӻ������
    cursor c_org is
      select o.user_id,o.user_quota,o.mms_quota,
      (select up.unit_price from unit_price_info up where up.organization_id=o.parentid and up.effective=0 and up.biz_type=0) unit_price
      from organization o
      where o.parentid !='0'
      and o.parentid !='1'
      and o.parentid in (select o2.user_id from organization o2 where o2.pay_type=0 and o2.pay_mode=1 and o2.parentid='1');

    c_user_each c_user%rowtype;
    c_org_each c_org%rowtype;


begin

    if c_user%isopen then
       close c_user;
    end if;
    if c_org%isopen then
       close c_org;
    end if;

    begin
      open c_user;
      loop
           fetch c_user into c_user_each;
           exit when c_user%notfound;
           DBMS_OUTPUT.PUT_LINE('c_user_each.unit_price = ' || c_user_each.unit_price );

           if c_user_each.unit_price is not null then
              insert into org_remain_balance
              (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
              values
              (sys_guid(), c_user_each.user_id,1, c_user_each.user_quota, c_user_each.unit_price,0, sysdate, '', '', sysdate, 0,c_user_each.mms_quota);
           end if;


      end loop;
      commit;
      close c_user;
    end;

    begin
      open c_org;
      loop
           fetch c_org into c_org_each;
           exit when c_org%notfound;
            DBMS_OUTPUT.PUT_LINE('c_org_each.unit_price = ' || c_org_each.unit_price );

           if c_org_each.unit_price is not null then
              insert into org_remain_balance
              (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
              values
              (sys_guid(), c_org_each.user_id,1, c_org_each.user_quota, c_org_each.unit_price,0, sysdate, '', '', sysdate, 1,c_org_each.mms_quota);
           end if;

      end loop;
      commit;
      close c_org;
    end;


end insert_all_org_quota;
/

prompt
prompt Creating procedure INSERT_DAILY_RECKONING_REPORT
prompt ================================================
prompt
create or replace procedure mc.insert_daily_reckoning_report is
    cursor c_consume is
     --�����ѯsend�������,���˷���,ͳ��һ��һ�췢�Ͷ��ٶ���
        select
             t.user_id,
             trunc(t.send_time) send_time,
             t.mobile_com,
             t.send_status,
             t.channel_id,
             t.unit_price,
             sum(t.mobile_quantities) mobile_quantities,
              sum(nvl(t.unit_price,0)*t.mobile_quantities) totalFee,
             u.user_name,
             u.pay_mode,
             u.fee_mode,
             u.user_quota,
             u.mms_quota as user_mms_quota,
             org.user_quota as org_quota,
             org.mms_quota as org_mms_quota
        from send t
        left join user_info u on t.user_id = u.user_id
        left join organization org on org.user_id = t.user_organization
        left join channel_info c on c.channel_id=t.channel_id                 --��ֱ��ͨ���͵�����ͨ��
       where  1=1
              and t.send_time is not null
              and t.send_time <=CAST(trunc(sysdate)-2 AS TIMESTAMP)
              and t.send_time >=CAST(trunc(sysdate)-3 AS TIMESTAMP)
              and (org.deduct_mode=1 and t.send_status = any(1,5) or org.deduct_mode=0 and t.send_status=any(1,5,6))   --����״̬ �� 1���ύ , 5���ͳɹ� ,6����ʧ��
              and ((t.is_original_sms=0 and c.link_mode != all('CMPP2','SGIP','SMGP3')) or (t.mobile_quantities=1 and c.link_mode = any('CMPP2','SGIP','SMGP3')))
       group by t.user_id,
                trunc(t.send_time),
                t.mobile_com,
                t.channel_id,
                t.send_status,
                t.unit_price,
                u.user_name,
                u.pay_mode,
                u.fee_mode,
                u.user_quota,
                u.mms_quota,
                org.user_quota,
                org.mms_quota;

    one_record c_consume%rowtype;                                                --�α���
    remainMessageQuota daily_reckoning_info.remain_message_quota%type;           --ʣ��������
     remainBalance     daily_reckoning_info.remain_balance%type;                 --ʣ����

begin
    remainMessageQuota :=0;  --��ʼֵ��Ϊ0
    remainBalance :=0;

    if c_consume%isopen then --��ֹ�ϴ��α�δ�ر�
      close c_consume;
    end if;

    --���α�
    open c_consume;
    --ѭ���α�
      loop
        fetch c_consume into one_record; --��ȡ�α�
          exit when c_consume%notfound;

           --ʣ������
           select u.user_quota into remainMessageQuota from user_info u where u.user_id=one_record.user_id;

           --ʣ����
           select u.user_balance into remainBalance from user_info u where u.user_id=one_record.user_id;

             --���������
           insert into daily_reckoning_info
           (DAILY_RECKONING_ID, USER_ID, USER_NAME, SEND_STATUS, SEND_QUANTITY, SUB_TOTAL_FEE, REMAIN_MESSAGE_QUOTA, REMAIN_MMS_QUOTA, RECKONING_DATE, RECORD_DATE, PAY_MODE, REMAIN_BALANCE, USER_MOME, MOBILE_COM,CHANNEL_ID,UNIT_PRICE)
           values
           (sys_guid(),one_record.user_id,one_record.user_name,one_record.send_status,one_record.mobile_quantities,one_record.totalfee,remainMessageQuota,0,one_record.send_time, sysdate,one_record.pay_mode,remainBalance,'--',one_record.mobile_com,one_record.channel_id,one_record.unit_price);
      end loop;

        commit;

   close c_consume;

   exception
       when others then
   rollback;

end insert_daily_reckoning_report;
/

prompt
prompt Creating procedure INSERT_EXTRA_PAYMENTRECORD
prompt =============================================
prompt
create or replace procedure mc.INSERT_EXTRA_PAYMENTRECORD
      (operatorId in varchar2,
       userType in number,
       userId in varchar2,
       paymentMoney in number,
       paymentQuota in number,
       paymentType in number,
       isOnline in number,
       quotaType in number,
       rechargeExplain in varchar2,
       RUN_RESULT    OUT NUMBER
       )
is

    v_parentId organization.parentid%type;
    v_orgId organization.user_id%type;
    v_payMode organization.pay_mode%type;
    v_unitPrice unit_price_info.unit_price%type;
   /* v_channel_userId payment_record.operator_id%type;
    v_channelSub_userId payment_record.operator_id%type;*/
begin

       --�����߳�ֵ
       if isOnline=0 then

           --�ͼ�Admin�������µ��ӻ�������˳�ֵ
           if operatorId='1' then
               --����
               if userType=1 then

                  SELECT o.user_id,o.parentid into v_orgId,v_parentId
                  FROM ORGANIZATION o where o.user_id=userId and userType=1;

                  --�����µ��ӻ���
                  IF v_parentId !='1' AND v_parentId !='0' and v_orgId !='1' then
                      --��ѯ�����ĵ���
                      SELECT o.pay_mode,up.unit_price into v_payMode,v_unitPrice
                      FROM organization o
                      left join unit_price_info up on up.organization_id=o.user_id and up.effective=0 and up.biz_type=0
                      where o.user_id=v_parentId;

                        --�ͼ�admin����ֵ����
                        if paymentType in(0,1) then

                           --������ֵ
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, v_unitPrice*nvl(paymentQuota,0), nvl(paymentQuota,0), operatorId, decode(v_payMode,1,1,0,0,null), 0, 1, rechargeExplain, quotaType, 1);
                        end if;
                        --�ͼ�admin�����ʲ���
                        if paymentType in(2,4) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, v_unitPrice*nvl(paymentQuota,0), nvl(paymentQuota,0), operatorId, decode(v_payMode,1,2,0,4,null), 0, 1, rechargeExplain, quotaType, 1);
                        end if;
                         --�ͼ�admin�����ʲ���
                        if paymentType in(3,5) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, v_unitPrice*nvl(paymentQuota,0), nvl(paymentQuota,0), operatorId, decode(v_payMode,1,3,0,5,null), 0, 1, rechargeExplain, quotaType, 1);
                        end if;
                  end if;
               end if;
               --�ͼ�admin�����˳�ֵ
               if userType=0 then

                  SELECT o.user_id,o.parentid into v_orgId,v_parentId
                  FROM user_info u
                  left join organization o on o.user_id=u.organization_id
                  where u.user_id=userId and userType=0;

                   --����
                  IF v_parentId ='1' then

                      SELECT o.user_id,o.parentid,o.pay_mode,up.unit_price into v_orgId,v_parentId,v_payMode,v_unitPrice
                      FROM user_info u
                      left join organization o on o.user_id=u.organization_id
                      left join unit_price_info up on up.organization_id=u.organization_id and up.effective=0 and up.biz_type=0
                      where u.user_id=userId and userType=0;
                      --�ͼ�admin����ֵ����
                      if paymentType in(0,1) then
                           --������ֵ
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate, paymentQuota*v_unitPrice, paymentQuota, operatorId, decode(v_payMode,1,1,0,0,null), 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                      --�ͼ�admin�����ʲ���
                      if paymentType in(2,4) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate, paymentQuota*v_unitPrice, paymentQuota, operatorId, decode(v_payMode,1,2,0,4,null), 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                      --�ͼ�admin�����ʲ���
                      if paymentType in(3,5) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate, paymentQuota*v_unitPrice, paymentQuota, operatorId, decode(v_payMode,1,3,0,5,null), 0, 1, rechargeExplain, quotaType, 1);
                      end if;

                  end if;
                  --�����ӻ���
                  IF v_parentId !='1' AND v_parentId !='0' and v_orgId !='1' then

                     SELECT o.pay_mode,up.unit_price into v_payMode,v_unitPrice
                      FROM organization o
                      left join unit_price_info up on up.organization_id=o.user_id and up.effective=0 and up.biz_type=0
                      where o.user_id=v_parentId;
                      --�ͼ�admin����ֵ����
                      if paymentType in(0,1) then
                           --������ֵ
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), decode(v_payMode,1,0,0,paymentQuota,null), operatorId, decode(v_payMode,1,1,0,0,null), 0, 1, rechargeExplain, quotaType, 1);
                           --�����ӻ�����ֵ
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate,decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), paymentQuota, operatorId, 0, 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                      --�ͼ�admin�����ʲ���
                      if paymentType in(2,4) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), decode(v_payMode,1,0,0,paymentQuota,null), operatorId, decode(v_payMode,1,2,0,4,null), 0, 1, rechargeExplain, quotaType, 1);
                           --�����ӻ�������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate,0, paymentQuota, operatorId, 4, 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                      --�ͼ�admin�����ʲ���
                      if paymentType in(3,5) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), decode(v_payMode,1,0,0,paymentQuota,null), operatorId, decode(v_payMode,1,3,0,5,null), 0, 1, rechargeExplain, quotaType, 1);
                           --�����ӻ�������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate,0, paymentQuota, operatorId, 5, 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                  end if;
               end if;
           end if;

           --����admin���ӻ�����Ա��ֵ
            if operatorId !='1' then
                  --��ѯ����
                  SELECT o.parentid,o.pay_mode,up.unit_price into v_parentId,v_payMode,v_unitPrice
                  FROM user_info u
                  left join organization o on o.user_id=u.organization_id
                   left join unit_price_info up on up.organization_id=o.user_id and up.effective=0 and up.biz_type=0
                  where u.user_id=operatorId and userType=0;
                  --��ѯ�ӻ���
                  SELECT o.user_id into v_orgId
                  FROM user_info u
                  left join organization o on o.user_id=u.organization_id
                  where u.user_id=userId and userType=0;

                  if v_parentId ='1' then
                        --��ֵ
                        if paymentType in(0,1) then
                             --�����ӻ�����ֵ
                             insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                             values (sys_guid(), v_orgId, sysdate, 0, nvl(paymentQuota,0), operatorId, 0, 0, 1, rechargeExplain, quotaType, 1);
                        end if;
                        --����
                        if paymentType in(2,4) then
                             --�����ӻ�������
                             insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                             values (sys_guid(), v_orgId, sysdate, 0, nvl(paymentQuota,0), operatorId, 4, 0, 1, rechargeExplain, quotaType, 1);
                        end if;
                        --����
                        if paymentType in(3,5) then
                             --�����ӻ�������
                             insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                             values (sys_guid(), v_orgId, sysdate, 0, nvl(paymentQuota,0), operatorId, 5, 0, 1, rechargeExplain, quotaType, 1);
                        end if;
                  end if;
            end if;

       end if;

        commit;

       RUN_RESULT    := 0;
       exception
           when others then
           RUN_RESULT    := 1;
       rollback;
end INSERT_EXTRA_PAYMENTRECORD;
/

prompt
prompt Creating procedure INSERT_HANDLE_DAILY_REPORT
prompt =============================================
prompt
CREATE OR REPLACE PROCEDURE mc.INSERT_HANDLE_DAILY_REPORT
      (RUN_TIME      IN VARCHAR2,
       RUN_RESULT    OUT NUMBER
       )
IS

    CURSOR C_CONSUME IS
     --�����ѯSEND�������,���˷���,ͳ��һ��һ�췢�Ͷ��ٶ���
        SELECT
             T.USER_ID,
             TRUNC(T.SEND_TIME) SEND_TIME,
             T.MOBILE_COM,
             T.SEND_STATUS,
             T.CHANNEL_ID,
             SUM(T.MOBILE_QUANTITIES) MOBILE_QUANTITIES,
             SUM(NVL(T.UNIT_PRICE,0)*T.MOBILE_QUANTITIES) TOTALFEE,
             T.UNIT_PRICE,
             U.USER_NAME,
             U.PAY_MODE,
             U.FEE_MODE,
             U.USER_QUOTA,
             U.MMS_QUOTA AS USER_MMS_QUOTA,
             ORG.USER_QUOTA AS ORG_QUOTA,
             ORG.MMS_QUOTA AS ORG_MMS_QUOTA
        FROM SEND T
        LEFT JOIN USER_INFO U ON T.USER_ID = U.USER_ID
        LEFT JOIN ORGANIZATION ORG ON ORG.USER_ID = T.USER_ORGANIZATION
        LEFT JOIN CHANNEL_INFO C ON C.CHANNEL_ID=T.CHANNEL_ID                 --��ֱ��ͨ���͵�����ͨ��
       WHERE  1=1
              AND T.SEND_TIME IS NOT NULL
              AND T.SEND_TIME >=NVL(TO_TIMESTAMP(RUN_TIME||' 00:00:00.000','YYYY-MM-DD HH24:MI:SS.FF'),CAST(TRUNC(SYSDATE)-3 AS TIMESTAMP))
              AND T.SEND_TIME <=NVL(TO_TIMESTAMP(RUN_TIME||' 23:59:59.999','YYYY-MM-DD HH24:MI:SS.FF'),CAST(TRUNC(SYSDATE)-2 AS TIMESTAMP))
              AND (ORG.DEDUCT_MODE=1 AND T.SEND_STATUS = ANY(1,5) OR ORG.DEDUCT_MODE=0 AND T.SEND_STATUS=ANY(1,5,6))   --����״̬ �� 1���ύ , 5���ͳɹ� ,6����ʧ��
              AND ((T.IS_ORIGINAL_SMS=0 AND C.LINK_MODE != ALL('CMPP2','SGIP','SMGP3')) OR (T.MOBILE_QUANTITIES=1 AND C.LINK_MODE = ANY('CMPP2','SGIP','SMGP3')))
       GROUP BY T.USER_ID,
                TRUNC(T.SEND_TIME),
                T.MOBILE_COM,
                T.CHANNEL_ID,
                T.SEND_STATUS,
                T.UNIT_PRICE,
                U.USER_NAME,
                U.PAY_MODE,
                U.FEE_MODE,
                U.USER_QUOTA,
                U.MMS_QUOTA,
                ORG.USER_QUOTA,
                ORG.MMS_QUOTA;

    ONE_RECORD C_CONSUME%ROWTYPE;                                                --�α���
    REMAINMESSAGEQUOTA DAILY_RECKONING_INFO.REMAIN_MESSAGE_QUOTA%TYPE;           --ʣ��������
    REMAINBALANCE     DAILY_RECKONING_INFO.REMAIN_BALANCE%TYPE;                 --ʣ����
    COUNT_MESSAGE  NUMBER;

BEGIN
    REMAINMESSAGEQUOTA :=0;  --��ʼֵ��Ϊ0
    REMAINBALANCE :=0;
    COUNT_MESSAGE :=0;

    --��ѯ��һ����սᵥ������Ƿ��Ѿ����ɹ����սᵥ
    SELECT COUNT(1) INTO COUNT_MESSAGE FROM DAILY_RECKONING_INFO D WHERE TO_CHAR(D.RECKONING_DATE,'YYYY-MM-DD')=RUN_TIME;
    --����սᵥ��û����һ��ļ�¼��������������һ�������
    if COUNT_MESSAGE=0 then
          IF C_CONSUME%ISOPEN THEN --��ֹ�ϴ��α�δ�ر�
            CLOSE C_CONSUME;
          END IF;

          --���α�
          OPEN C_CONSUME;
          --ѭ���α�
            LOOP
              FETCH C_CONSUME INTO ONE_RECORD; --��ȡ�α�
                EXIT WHEN C_CONSUME%NOTFOUND;

                 --ʣ������
                 SELECT U.USER_QUOTA INTO REMAINMESSAGEQUOTA FROM USER_INFO U WHERE U.USER_ID=ONE_RECORD.USER_ID;

                 --ʣ����
                 SELECT U.USER_BALANCE INTO REMAINBALANCE FROM USER_INFO U WHERE U.USER_ID=ONE_RECORD.USER_ID;

                   --���������
                 INSERT INTO DAILY_RECKONING_INFO
                 (DAILY_RECKONING_ID, USER_ID, USER_NAME, SEND_STATUS, SEND_QUANTITY, SUB_TOTAL_FEE, REMAIN_MESSAGE_QUOTA, REMAIN_MMS_QUOTA, RECKONING_DATE, RECORD_DATE, PAY_MODE, REMAIN_BALANCE, USER_MOME, MOBILE_COM,CHANNEL_ID,UNIT_PRICE)
                 VALUES
                 (SYS_GUID(),ONE_RECORD.USER_ID,ONE_RECORD.USER_NAME,ONE_RECORD.SEND_STATUS,ONE_RECORD.MOBILE_QUANTITIES,ONE_RECORD.TOTALFEE,REMAINMESSAGEQUOTA,0,ONE_RECORD.SEND_TIME, SYSDATE,ONE_RECORD.PAY_MODE,REMAINBALANCE,'--',ONE_RECORD.MOBILE_COM,ONE_RECORD.CHANNEL_ID,ONE_RECORD.UNIT_PRICE);
            END LOOP;

              COMMIT;

         CLOSE C_CONSUME;
    end if;

    RUN_RESULT    := 0;

   EXCEPTION
       WHEN OTHERS THEN
       RUN_RESULT    := 1;
   ROLLBACK;

END INSERT_HANDLE_DAILY_REPORT;
/

prompt
prompt Creating procedure INSERT_MONTH_RECKONING_REPORT
prompt ================================================
prompt
CREATE OR REPLACE PROCEDURE mc.INSERT_MONTH_RECKONING_REPORT IS
    CURSOR C_CONSUME IS
    --�����ѯ�սᵥ�������,���˷���,ͳ��ÿ��ÿ�·��Ͷ��ٶ���
       SELECT D.USER_ID,
        D.USER_NAME,
        U.USER_MOME,
        U.ORGANIZATION_ID,
        D.SEND_STATUS,
        SUM(D.SEND_QUANTITY) SEND_QUANTITY,
        SUM(D.SUB_TOTAL_FEE) COST_FEE,
        D.RECKONING_DATE,
        D.MOBILE_COM,
        D.CHANNEL_ID,
        D.UNIT_PRICE
   FROM DAILY_RECKONING_INFO D
   LEFT JOIN USER_INFO U ON U.USER_ID = D.USER_ID
   WHERE 1=1
   AND TO_CHAR(D.RECKONING_DATE, 'YYYY-MM-DD') >= TO_CHAR(TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-2))+1,'MM'),'YYYY-MM-DD')
   AND TO_CHAR(D.RECKONING_DATE, 'YYYY-MM-DD') <= TO_CHAR(TRUNC(ADD_MONTHS(SYSDATE, 0), 'MM') - 1,'YYYY-MM-DD')
  GROUP BY D.USER_ID,
           D.USER_NAME,
           U.USER_MOME,
           U.ORGANIZATION_ID,
           D.SEND_STATUS,
           D.RECKONING_DATE,
           D.MOBILE_COM,
           D.CHANNEL_ID,
           D.UNIT_PRICE;

     --����ʧ�ܵĶ���
     CURSOR C_MONTH_MAIN IS
         SELECT SUM(S1.UNIT_PRICE*S1.MOBILE_QUANTITIES) FAIL_FEE,
               SUM(S1.MOBILE_QUANTITIES) FAIL_QUATA,
               S1.USER_ID,
               O.FEE_MODE,
               S1.USER_ORGANIZATION ORGANIZATION_ID,
               O.PAY_MODE ORGPAYMODE
          FROM SEND S1
          LEFT JOIN USER_INFO U ON S1.USER_ID = U.USER_ID
          LEFT JOIN ORGANIZATION O ON S1.USER_ORGANIZATION = O.USER_ID
          LEFT JOIN CHANNEL_INFO C ON S1.CHANNEL_ID = C.CHANNEL_ID
         WHERE 1=1
           AND S1.REPORT_TIME <=CAST(TRUNC(SYSDATE,'MONTH')+3 AS TIMESTAMP)                   --���µ�4���賿
           AND S1.REPORT_TIME >=CAST(TRUNC(SYSDATE,'MONTH') AS TIMESTAMP)                     --���µ�1���賿
           AND S1.SEND_TIME >=CAST(TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1)))-2 AS TIMESTAMP)    --�µ׵�����3��
           AND S1.SEND_TIME <= CAST(TRUNC(SYSDATE,'MONTH') AS TIMESTAMP)                       --�µ����1��
           AND S1.RETURN_FEE =1                                                              --���ط���:�ѷ��ط���
         GROUP BY S1.USER_ID, U.PAY_MODE, O.FEE_MODE,S1.USER_ORGANIZATION,O.PAY_MODE;

     ONE_RECORD C_CONSUME%ROWTYPE;           --�α���
     ONE_MAIN C_MONTH_MAIN%ROWTYPE;          --�α���

BEGIN
       IF C_MONTH_MAIN%ISOPEN THEN --��ֹ�ϴ��α�δ�ر�
          CLOSE C_MONTH_MAIN;
       END IF;
       IF C_CONSUME%ISOPEN THEN --��ֹ�ϴ��α�δ�ر�
          CLOSE C_CONSUME;
       END IF;
       --��ʧ�ܷ����Ķ��żӵ��ϸ��µ׵��û�/���������
       BEGIN
           OPEN C_MONTH_MAIN;
                LOOP
                    FETCH C_MONTH_MAIN INTO ONE_MAIN;
                    EXIT WHEN C_MONTH_MAIN%NOTFOUND;
                    --�Ը���
                    IF ONE_MAIN.FEE_MODE = 0 THEN
                       UPDATE MONTH_MAIN_INFO MM
                       SET MM.REMAIN_QUOTA = MM.REMAIN_QUOTA + nvl(ONE_MAIN.FAIL_QUATA,0)
                       WHERE MM.USER_ID=ONE_MAIN.USER_ID
                       AND MM.USER_TYPE=0
                       AND MM.TIME=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                    END IF;
                    --�鸶��
                    IF ONE_MAIN.FEE_MODE=1 THEN
                       --����
                       IF ONE_MAIN.ORGPAYMODE=1 THEN
                          UPDATE MONTH_MAIN_INFO MM
                          SET MM.REMAIN_FEE = MM.REMAIN_FEE + nvl(ONE_MAIN.FAIL_FEE,0)
                          WHERE MM.USER_ID = ONE_MAIN.ORGANIZATION_ID
                          AND MM.USER_TYPE=1
                          AND MM.TIME=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                       END IF;
                       --����
                       IF ONE_MAIN.ORGPAYMODE=0 THEN

                        --DBMS_OUTPUT.PUT_LINE('ONE_MAIN.FAIL_QUATA = '|| ONE_MAIN.FAIL_QUATA || '  ONE_MAIN.ORGANIZATION_ID=' ||ONE_MAIN.ORGANIZATION_ID ||' time='|| TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));

                          UPDATE MONTH_MAIN_INFO MM
                          SET MM.REMAIN_QUOTA = MM.REMAIN_QUOTA + nvl(ONE_MAIN.FAIL_QUATA,0)
                          WHERE MM.USER_ID = ONE_MAIN.ORGANIZATION_ID
                          AND MM.USER_TYPE=1
                          AND MM.TIME=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                       END IF;
                    END IF;

                END LOOP;

                COMMIT;

           CLOSE C_MONTH_MAIN;
       END;

       BEGIN
        --���α�
        OPEN C_CONSUME;
        --ѭ���α�
          LOOP
            FETCH C_CONSUME INTO ONE_RECORD; --��ȡ�α�
              EXIT WHEN C_CONSUME%NOTFOUND;

                INSERT INTO MONTH_RECKONING_INFO
                  (MONTH_RECKONING_ID,
                   USER_ID,
                   ORGANIZATION_ID,
                   MONTH_PAYMENT,
                   MONTH_BEGIN_BALANCE,
                   MONTH_END_BALANCE,
                   SEND_QUANTITY,
                   COST_FEE,
                   RECORD_DATE,
                   INNER_PAYMENT,
                   MOBILE_COM,
                   CHANNEL_ID,
                   ACCOUNT_TIME,
                   UNIT_PRICE)
                VALUES
                  (SYS_GUID(),
                   ONE_RECORD.USER_ID,
                   ONE_RECORD.ORGANIZATION_ID,
                   0.00,
                   0.00,
                   0.00,
                   ONE_RECORD.SEND_QUANTITY,
                   ONE_RECORD.COST_FEE,
                   SYSDATE,
                   0.00,
                   ONE_RECORD.MOBILE_COM,
                   ONE_RECORD.CHANNEL_ID,
                   TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'),
                   ONE_RECORD.UNIT_PRICE);

          END LOOP;

          COMMIT;
          CLOSE C_CONSUME;
        END;

   EXCEPTION
       WHEN OTHERS THEN
   ROLLBACK;

END INSERT_MONTH_RECKONING_REPORT;
/

prompt
prompt Creating procedure INSERT_MONTH_REMAIN_FEE
prompt ==========================================
prompt
CREATE OR REPLACE PROCEDURE mc.INSERT_MONTH_REMAIN_FEE IS
    --�α꣺��ѯ�û����
    cursor c_user is
        select u.user_id, u.user_quota
        from user_info u
        left join organization o on o.user_id = u.organization_id
        group by u.user_id,u.user_quota;
    --�α꣺��ѯ�������
    cursor c_org is
      select o.user_id,o.parentid,o.pay_mode,o.user_quota,o.user_balance
      from organization o
      left join user_info u on u.organization_id=o.user_id
      group by o.user_id,o.parentid,o.pay_mode,o.user_quota,o.user_balance;

    c_user_each c_user%rowtype;
    c_org_each c_org%rowtype;

    v_moneyAdd organization.user_balance%type;         --����ֵ
    v_moneySub organization.user_balance%type;         --������
    v_quotaAdd organization.user_quota%type;           --����ֵ
    v_quotaSub organization.user_quota%type;           --������
    v_checkNum number;                                 --��¼���������µ������������Ϊ0�����������
    v_blanceRemain organization.user_balance%type;     --�м�ֵ����¼����������ܽ������ӻ������û����ܺͣ�
    v_quotaRemain  organization.user_quota%type;       --�м�ֵ����¼����������ܽ������ӻ������û����ܺͣ�

BEGIN
    v_moneyAdd :=0;
    v_moneySub :=0;
    v_quotaAdd :=0;
    v_quotaSub :=0;
    v_blanceRemain :=0;
    v_quotaRemain :=0;

    if c_user%isopen then
       close c_user;
    end if;
    if c_org%isopen then
       close c_org;
    end if;

    select count(1) into v_checkNum from month_main_info mm where mm.time = TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');

    if v_checkNum =0 then
            begin
              open c_user;
              loop
                   fetch c_user into c_user_each;
                   exit when c_user%notfound;
                   --�û���ֵ������
                   select sum(p.payment_quota) into v_quotaAdd  from payment_record p
                   where p.user_id = c_user_each.user_id
                   and p.payment_type = any(0,5)
                   and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                   --�û�����
                   select sum(p.payment_quota) into v_quotaSub  from payment_record p
                   where p.user_id = c_user_each.user_id
                   and p.payment_type = 4
                   and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');

                   --�����Ը����û����,��ֵ����
                   insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                   values (sys_guid(),c_user_each.user_id,0, nvl(c_user_each.user_quota,0), 0, nvl(v_quotaAdd,0)-nvl(v_quotaSub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));

              end loop;
              commit;
              close c_user;
            end;

            begin
              open c_org;
              loop
                   fetch c_org into c_org_each;
                   exit when c_org%notfound;

                   --�����ӻ���(ȫ��Ϊ����ֵ)
                   if c_org_each.parentid !='1' and c_org_each.parentid !='0' and c_org_each.user_id !='1' then
                       --��ֵ������
                       select sum(nvl(p.payment_quota,0)) into v_quotaAdd
                       from payment_record p
                       left join organization o on o.user_id=p.user_id
                       where 1=1
                       and p.user_id = c_org_each.user_id
                       and (p.payment_type=any(0,5) and p.is_online=0 or p.is_online=1)
                       and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                       --����
                       select sum(nvl(p.payment_quota,0)) into v_quotaSub
                       from payment_record p
                       left join organization o on o.user_id=p.user_id
                       where 1=1
                       and p.user_id = c_org_each.user_id
                       and p.payment_type=4
                       and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');

                        select sum(user_quota) into v_quotaRemain from (
                        select sum(o.user_quota) user_quota from organization o where o.user_id=c_org_each.user_id
                        union all
                        select sum(u.user_quota) user_quota from user_info u where u.organization_id=c_org_each.user_id);
                        --����������
                       insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                       values (sys_guid(),c_org_each.user_id,1, nvl(v_quotaRemain,0), 0, nvl(v_quotaAdd,0)-nvl(v_quotaSub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));

                   end if;

                   --����(����Ϊ�������)
                   if c_org_each.parentid ='1' then
                         --�������
                         if c_org_each.pay_mode=0 then
                             --��ֵ������
                             select sum(nvl(p.payment_quota,0)) into v_quotaAdd
                             from payment_record p
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and (p.payment_type=any(0,5) and p.is_online=0 or p.is_online=1)
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                             --����
                             select sum(nvl(p.payment_quota,0)) into v_quotaSub
                             from payment_record p
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and p.payment_type=4
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');

                             select sum(user_quota) into v_quotaRemain from (
                              select sum(o.user_quota) user_quota from organization o
                              where o.parentid=c_org_each.user_id or o.user_id=c_org_each.user_id
                              union all
                              select sum(u.user_quota) user_quota from user_info u
                              left join organization o on o.user_id=u.organization_id
                              where o.user_id=c_org_each.user_id or o.parentid=c_org_each.user_id);
                              --����������,��ֵ��
                             insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                             values (sys_guid(),c_org_each.user_id,1, nvl(v_quotaRemain,0), 0, nvl(v_quotaAdd,0)-nvl(v_quotaSub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                         end if;

                         --�������
                         if c_org_each.pay_mode=1 then
                             --��ֵ������
                             select sum(nvl(p.payment_money,0)) into v_moneyAdd
                             from payment_record p
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and (p.payment_type=any(1,3) and p.is_online=0 or p.is_online=1)
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                             --����
                             select sum(nvl(p.payment_money,0)) into v_moneySub
                             from payment_record p
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and p.payment_type=2
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                             --��ѯ�ӻ������û������(����ɽ��)
                             select sum(orb.sms_quota*orb.unit_price) into v_blanceRemain from
                              org_remain_balance orb
                              where orb.user_id in (select o.user_id from organization o where o.parentid=c_org_each.user_id)
                              or orb.user_id in (select u.user_id from user_info u
                                                   left join organization o on o.user_id=u.organization_id
                                                   where o.user_id=c_org_each.user_id or o.parentid=c_org_each.user_id);
                             v_blanceRemain := c_org_each.user_balance + v_blanceRemain;
                              --����������,��ֵ��
                             insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                             values (sys_guid(),c_org_each.user_id,1, nvl(c_org_each.user_quota,0), nvl(v_blanceRemain,0), nvl(v_moneyAdd,0)-nvl(v_moneySub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                         end if;

                   end if;

                   --�ͼ�(û���ĸ���������Ϊ�ͼѳ�ֵ)
                   if c_org_each.parentid ='0' then
                         --����������,��ֵ��
                         insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                         values (sys_guid(),c_org_each.user_id,1, nvl(c_org_each.user_quota,0), nvl(c_org_each.user_balance,0),'0', TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                   end if;

              end loop;
              commit;
              close c_org;
            end;
    end if;

  exception
       when others then
   rollback;
END INSERT_MONTH_REMAIN_FEE;
/

prompt
prompt Creating procedure INSERT_ORG_QUOTA
prompt ===================================
prompt
create or replace procedure mc.insert_org_quota
      (operatorId in varchar2,
       userId in varchar2,
       rechargeExplain in varchar2,
       paymentType in number,
       userQuota in number,
       userType in number,
       RUN_RESULT    OUT NUMBER
       )
is

    orgCount number;   --��ѯ��������Ƿ��Ѿ���������
    v_unitprice org_remain_balance.unit_price%type;
    v_payMode organization.pay_mode%type;
    v_parentid organization.parentid%type;
    v_operatorId user_info.user_id%type;
    v_extraQuota organization.user_quota%type; --�ӻ������û���ֵ����ֵ����-��ǰЭ������ �����
    v_lastQuota organization.user_quota%type;  --ʱ�������һ�����
    v_userQuota organization.user_quota%type;  --��ֵ���������ݳ�ֵ���ͣ�ѡ��������������ֵΪ��������Ϊ��
    v_subOrgId  organization.user_id%type;     --�м�ֵ�����ӻ���id
begin
    orgCount :=0;
    v_unitprice :=0;
    v_userQuota :=0;

    if paymentType =4 then
       v_userQuota := 0-userQuota;
    elsif paymentType !=4 then
       v_userQuota := userQuota;
    end if;

    --��������ӻ�����ֵ
    if userType=1 then
        select count(1) into orgCount from org_remain_balance orb where orb.user_id =userId
        and orb.status=1
        and orb.unit_price=(select up.unit_price from unit_price_info up where up.organization_id=(select o.parentid from organization o where o.user_id=userId) and up.effective=0 and up.biz_type=0);

        if orgCount>0 then
            update org_remain_balance orb
            set orb.sms_quota = orb.sms_quota+ v_userQuota, orb.last_update_quota_date =sysdate
            where orb.user_id = userId
            and orb.status=1
            and orb.unit_price=(select up.unit_price from unit_price_info up where up.organization_id=(select o.parentid from organization o where o.user_id=userId) and up.effective=0 and up.biz_type=0);
        elsif orgCount=0 then
              select up.unit_price into v_unitprice from unit_price_info up
              where up.organization_id=(select o.parentid from organization o where o.user_id=userId)
              and up.effective=0
              and up.biz_type=0;

             insert into org_remain_balance
             (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
             values
             (sys_guid(), userId,1, v_userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
        end if;
    end if;
    --�û���ֵ
    if userType=0 then
        select o.parentid into v_parentid  from organization o where o.user_id=(select u.organization_id from user_info u where u.user_id=userId);
        --�����û�
        if v_parentid='1' then
              SELECT up.unit_price,o.pay_mode into v_unitprice,v_payMode
              FROM organization o
              left join user_info u on u.organization_id=o.user_id
              left join unit_price_info up on up.organization_id=o.user_id
              where u.user_id=userId
              and up.biz_type =0
              and up.effective=0;
               --��������µģ��ӻ������û�
              if v_payMode=1 then
                    /* �����û������
                    *  ���������Ȼʹ�û�����Ľ��
                    */
                    select count(1) into orgCount
                    from org_remain_balance orb
                    where orb.user_id = userId
                    and orb.unit_price =v_unitprice
                    and orb.status=1;
                    --�������Ѵ��ڴ��û�����Э������޸����
                    if orgCount>0 then
                        update org_remain_balance orb
                        set orb.sms_quota = orb.sms_quota+ v_userQuota, orb.last_update_quota_date =sysdate
                        where orb.user_id = userId
                        and orb.status=1
                        and orb.unit_price=v_unitprice;
                     --�����в����ڴ��û�����Э������������
                    elsif orgCount=0 then
                         insert into org_remain_balance
                         (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                         values
                         (sys_guid(), userId,1, v_userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                    end if;
              end if;

        end if;
        --���������û�
        if v_parentid !='1' and v_parentid !='0' then
              SELECT up.unit_price,o.pay_mode into v_unitprice,v_payMode
              FROM organization o
              left join unit_price_info up on up.organization_id=o.user_id
              where o.parentid='1'
              and up.effective=0
              and up.biz_type =0
              START WITH o.user_id=(select u.organization_id from user_info u where u.user_id=userId)
              CONNECT BY PRIOR o.parentid=o.user_id;
              --��������µģ��ӻ������û�
              if v_payMode=1 then
                    --����Ǻͼ�Admin���ӻ����û�Խ����ֵ��ֱ�Ӽӵ��û������������
                    if operatorId = '1' then
                          --��ѯ�û��Ƿ������µ�Э������
                          select count(1) into orgCount
                          from org_remain_balance orb
                          where orb.user_id = userId
                          and orb.status=1
                          and orb.unit_price =v_unitprice;
                          --�������Ѵ��ڴ��û�����Э������޸����
                           if orgCount>0 then
                              update org_remain_balance orb
                              set orb.sms_quota = orb.sms_quota+ v_userQuota, orb.last_update_quota_date =sysdate
                              where orb.user_id = userId
                              and orb.status=1
                              and orb.unit_price=v_unitprice;
                           --�����в����ڴ��û�����Э������������
                           elsif orgCount=0 then
                               insert into org_remain_balance
                               (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                               values
                               (sys_guid(), userId,1, v_userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                           end if;
                     /*�ӻ�������Ա���������û���ֵ */
                    elsif  operatorId != '1' then
                             -- ��ѯ��ֵ������(������ӻ����Ĺ���Ա����ִ�г�ֵ�㷨)
                             select u.user_id into v_operatorId
                             from user_info u
                             where u.user_type=1
                             and u.user_stat=1
                             and u.organization_id=(select ui.organization_id from user_info ui where ui.user_id=userId and ui.user_stat=1);
                             --����ӻ�������Ա���Լ��û���ֵ���ӻ����۳���Ӧ������
                             if v_operatorId =operatorId then
                                  --��ѯ�ӻ�����id
                                  select u.organization_id into v_subOrgId from user_info u where u.user_stat = 1 and u.user_id = userId;

                                  if v_userQuota >0 then

                                      begin
                                          --��ѯ�ӻ�������������Э���������ӻ������
                                              select orb.sms_quota, orb.unit_price
                                                into v_lastQuota, v_unitprice
                                                from org_remain_balance orb
                                               where orb.status = 1
                                                 and orb.user_id = v_subOrgId
                                                 and orb.update_unitprice_date =
                                                     (select min(orb2.update_unitprice_date)  from org_remain_balance orb2
                                                       where orb2.user_id = v_subOrgId and orb2.status = 1 and orb2.sms_quota > 0);
                                          v_extraQuota := userQuota;
                                          if (userQuota - v_lastQuota) <=0 then
                                               /* �����û������ */
                                               select count(1) into orgCount
                                               from org_remain_balance orb
                                               where orb.user_id = userId
                                               and orb.status =1
                                               and orb.unit_price =v_unitprice;
                                                --�������Ѵ��ڴ��û�����Э������޸����
                                               if orgCount>0 then
                                                  update org_remain_balance orb
                                                  set orb.sms_quota = orb.sms_quota+ userQuota, orb.last_update_quota_date =sysdate
                                                  where orb.user_id = userId
                                                  and orb.status=1
                                                  and orb.unit_price=v_unitprice;
                                               --�����в����ڴ��û�����Э������������
                                               elsif orgCount=0 then
                                                   insert into org_remain_balance
                                                   (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                   values
                                                   (sys_guid(), userId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                               end if;
                                              /* ��ֵ��������Э������С���۳���Ӧ���ӻ������ */
                                              update org_remain_balance orb
                                              set orb.sms_quota = orb.sms_quota - userQuota, orb.last_update_quota_date =sysdate
                                              where orb.user_id = v_subOrgId
                                              and orb.status=1
                                              and orb.unit_price=v_unitprice;
                                         /* end if;
                                         --�㷨���ӻ������Լ��û���ֵ,ʹ��ѭ��
                                         if v_extraQuota >0 then*/
                                         else
                                            loop
                                              --��ѯ�ӻ�������������Э���������ӻ������
                                              select orb.sms_quota, orb.unit_price
                                                into v_lastQuota, v_unitprice
                                                from org_remain_balance orb
                                               where orb.status = 1
                                                 and orb.user_id = v_subOrgId
                                                 and orb.update_unitprice_date =
                                                     (select min(orb2.update_unitprice_date)
                                                        from org_remain_balance orb2
                                                       where orb2.user_id = v_subOrgId
                                                         and orb2.status = 1
                                                         and orb2.sms_quota > 0);
                                              DBMS_OUTPUT.PUT_LINE('�㷨���ӻ������Լ��û���ֵ,��ʼѭ�� v_lastQuota' ||v_lastQuota||' v_unitprice'||v_unitprice  );
                                              --��ʱ�������һ��Э�����ʼ��
                                              v_extraQuota := v_extraQuota - v_lastQuota;
                                              DBMS_OUTPUT.PUT_LINE('v_extraQuota '||v_extraQuota);
                                               --�����ֵ�����һ��Э��ۻ���
                                              if v_extraQuota >=0 then
                                              /* �����û������ */
                                                  select count(1) into orgCount
                                                  from org_remain_balance orb
                                                  where orb.user_id = userId
                                                  and orb.status =1
                                                  and orb.unit_price =v_unitprice;
                                                  DBMS_OUTPUT.PUT_LINE('��ʼ�����û���� orgCount '||orgCount);
                                                  --�������Ѵ��ڴ��û�����Э������޸����
                                                   if orgCount>0 then
                                                      update org_remain_balance orb
                                                      set orb.sms_quota = orb.sms_quota+ v_lastQuota, orb.last_update_quota_date =sysdate
                                                      where orb.user_id = userId
                                                      and orb.status=1
                                                      and orb.unit_price=v_unitprice;
                                                   --�����в����ڴ��û�����Э������������
                                                   elsif orgCount=0 then
                                                       insert into org_remain_balance
                                                       (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                       values
                                                       (sys_guid(), userId,1, v_lastQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                                   end if;
                                               /* ��һ��Э��۵����ȳ�ֵ��С���ӻ������������ */
                                                    update org_remain_balance orb
                                                    set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                                                    where orb.user_id = v_subOrgId
                                                    and orb.status=1
                                                    and orb.unit_price=v_unitprice;
                                              --��ֵ�����һ�������Э������С
                                              elsif v_extraQuota <0 then
                                                   /* �����û������ */
                                                   select count(1) into orgCount
                                                   from org_remain_balance orb
                                                   where orb.user_id = userId
                                                   and orb.status =1
                                                   and orb.unit_price =v_unitprice;
                                                    --�������Ѵ��ڴ��û�����Э������޸����
                                                   if orgCount>0 then
                                                      update org_remain_balance orb
                                                      set orb.sms_quota = orb.sms_quota+ v_lastQuota+v_extraQuota, orb.last_update_quota_date =sysdate
                                                      where orb.user_id = userId
                                                      and orb.status=1
                                                      and orb.unit_price=v_unitprice;
                                                   --�����в����ڴ��û�����Э������������
                                                   elsif orgCount=0 then
                                                       insert into org_remain_balance
                                                       (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                       values
                                                       (sys_guid(), userId,1, v_lastQuota+v_extraQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                                   end if;
                                                  /* ��ֵ��������Э������С���۳���Ӧ���ӻ������ */
                                                  update org_remain_balance orb
                                                  set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                                                  where orb.user_id = v_subOrgId
                                                  and orb.status=1
                                                  and orb.unit_price=v_unitprice;
                                              end if;
                                              --��ֵ��������Э�����С��0���˳�ѭ��
                                              exit when v_extraQuota <=0;
                                          end loop;
                                         end if;

                                      end;
                                  --�û�����
                                  elsif v_userQuota <0  then
                                        begin
                                          --��ѯ�û�����������Э���������ӻ������
                                          select orb.sms_quota, orb.unit_price
                                            into v_lastQuota, v_unitprice
                                            from org_remain_balance orb
                                           where orb.status = 1
                                             and orb.user_id = userId
                                             and orb.update_unitprice_date =
                                                 (select min(orb2.update_unitprice_date)
                                                    from org_remain_balance orb2
                                                   where orb2.user_id = userId
                                                     and orb2.status = 1
                                                     and orb2.sms_quota > 0);
                                          v_extraQuota := userQuota;
                                          if (userQuota - v_lastQuota) <=0 then
                                              /* �����ӻ�������� */
                                               select count(1) into orgCount
                                               from org_remain_balance orb
                                               where orb.user_id = v_subOrgId
                                               and orb.status =1
                                               and orb.unit_price =v_unitprice;
                                                --�������Ѵ��ڴ��û�����Э������޸����
                                               if orgCount>0 then
                                                  update org_remain_balance orb
                                                  set orb.sms_quota = orb.sms_quota+ userQuota, orb.last_update_quota_date =sysdate
                                                  where orb.user_id = v_subOrgId
                                                  and orb.status=1
                                                  and orb.unit_price=v_unitprice;
                                               --�����в����ڴ��û�����Э������������
                                               elsif orgCount=0 then
                                                   insert into org_remain_balance
                                                   (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                   values
                                                   (sys_guid(), v_subOrgId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
                                               end if;
                                              /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                                              update org_remain_balance orb
                                              set orb.sms_quota = orb.sms_quota - userQuota, orb.last_update_quota_date =sysdate
                                              where orb.user_id = userId
                                              and orb.status=1
                                              and orb.unit_price=v_unitprice;
                                          /*end if;*/
                                          else
                                            loop
                                                --��ѯ�û�����������Э���������ӻ������
                                                select orb.sms_quota, orb.unit_price
                                                  into v_lastQuota, v_unitprice
                                                  from org_remain_balance orb
                                                 where orb.status = 1
                                                   and orb.user_id = userId
                                                   and orb.update_unitprice_date =
                                                       (select min(orb2.update_unitprice_date)
                                                          from org_remain_balance orb2
                                                         where orb2.user_id = userId
                                                           and orb2.status = 1
                                                           and orb2.sms_quota > 0);
                                                --��ʱ�������һ��Э�����ʼ��
                                                v_extraQuota := v_extraQuota - v_lastQuota;
                                                --�����ֵ�����һ��Э��ۻ���
                                                if v_extraQuota >=0 then
                                                    /* �����ӻ�������� */
                                                    select count(1) into orgCount
                                                    from org_remain_balance orb
                                                    where orb.user_id = v_subOrgId
                                                    and orb.status =1
                                                    and orb.unit_price =v_unitprice;
                                                    --�������Ѵ��ڴ��ӻ�������Э������޸����
                                                     if orgCount>0 then
                                                        update org_remain_balance orb
                                                        set orb.sms_quota = orb.sms_quota+ v_lastQuota, orb.last_update_quota_date =sysdate
                                                        where orb.user_id = v_subOrgId
                                                        and orb.status=1
                                                        and orb.unit_price=v_unitprice;
                                                     --�����в����ڴ��û�����Э������������
                                                     elsif orgCount=0 then
                                                         insert into org_remain_balance
                                                         (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                         values
                                                         (sys_guid(), v_subOrgId,1, v_lastQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
                                                     end if;
                                                 /* ��һ��Э��۵����ȳ�ֵ��С���û���������� */
                                                      update org_remain_balance orb
                                                      set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                                                      where orb.user_id = userId
                                                      and orb.status=1
                                                      and orb.unit_price=v_unitprice;

                                                 --��ֵ�����һ�������Э������С
                                                elsif v_extraQuota <0 then
                                                     /* �����ӻ�������� */
                                                     select count(1) into orgCount
                                                     from org_remain_balance orb
                                                     where orb.user_id = v_subOrgId
                                                     and orb.status =1
                                                     and orb.unit_price =v_unitprice;
                                                      --�������Ѵ��ڴ��û�����Э������޸����
                                                     if orgCount>0 then
                                                        update org_remain_balance orb
                                                        set orb.sms_quota = orb.sms_quota+ v_lastQuota+v_extraQuota, orb.last_update_quota_date =sysdate
                                                        where orb.user_id = v_subOrgId
                                                        and orb.status=1
                                                        and orb.unit_price=v_unitprice;
                                                     --�����в����ڴ��û�����Э������������
                                                     elsif orgCount=0 then
                                                         insert into org_remain_balance
                                                         (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                         values
                                                         (sys_guid(), v_subOrgId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
                                                     end if;
                                                    /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                                                    update org_remain_balance orb
                                                    set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                                                    where orb.user_id = userId
                                                    and orb.status=1
                                                    and orb.unit_price=v_unitprice;
                                                end if;

                                                exit when v_extraQuota <=0;
                                            end loop;
                                          end if;
                                        end;
                                  end if;
                             /*��������Ա���ӻ����û���ֵ*/
                             else
                                    --�û���ֵ������
                                  if v_userQuota >0 then
                                       --��ѯ�ӻ�������������Э���������ӻ������
                                        select up.unit_price,
                                        (select orb.sms_quota from org_remain_balance orb
                                        where orb.status=1 and orb.user_id = userId
                                        and orb.unit_price=up.unit_price) sms_quota
                                        into v_unitprice,v_lastQuota
                                       from unit_price_info up
                                       left join organization o on o.user_id=up.organization_id
                                       left join user_info u on u.organization_id=o.user_id
                                      where u.user_id = operatorId
                                       and up.effective=0
                                       and up.biz_type=0;
                                      if v_lastQuota is null or v_lastQuota=0 then
                                           insert into org_remain_balance
                                           (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                           values
                                           (sys_guid(), userId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                      else
                                           update org_remain_balance orb
                                           set orb.sms_quota = orb.sms_quota + userQuota,orb.last_update_quota_date = sysdate
                                           where orb.user_id = userId
                                           and orb.unit_price = v_unitprice;
                                      end if;

                                  --�û�����
                                  elsif v_userQuota <0  then
                                        begin
                                          --��ѯ�û�����������Э���������ӻ������
                                          select orb.sms_quota, orb.unit_price
                                            into v_lastQuota, v_unitprice
                                            from org_remain_balance orb
                                           where orb.status = 1
                                             and orb.user_id = userId
                                             and orb.update_unitprice_date =
                                                 (select min(orb2.update_unitprice_date)
                                                    from org_remain_balance orb2
                                                   where orb2.user_id = userId
                                                     and orb2.status = 1
                                                     and orb2.sms_quota > 0);
                                          v_extraQuota := userQuota;
                                          --��ֵ��������һ��Э��������
                                          if (userQuota - v_lastQuota) <=0 then
                                               /*��java�������Ѿ����������Ľ��˴������ټ�
                                               ��ֵ��������Э������С���۳���Ӧ���û����*/
                                              update org_remain_balance orb
                                              set orb.sms_quota = orb.sms_quota - userQuota, orb.last_update_quota_date =sysdate
                                              where orb.user_id = userId
                                              and orb.status=1
                                              and orb.unit_price=v_unitprice;
                                          --��ֵ��������һ��Э�������
                                          else
                                            loop
                                                --��ѯ�û�����������Э���������ӻ������
                                                select orb.sms_quota, orb.unit_price
                                                  into v_lastQuota, v_unitprice
                                                  from org_remain_balance orb
                                                 where orb.status = 1
                                                   and orb.user_id = userId
                                                   and orb.update_unitprice_date =
                                                       (select min(orb2.update_unitprice_date)
                                                          from org_remain_balance orb2
                                                         where orb2.user_id = userId
                                                           and orb2.status = 1
                                                           and orb2.sms_quota > 0);
                                                --��ʱ�������һ��Э�����ʼ��
                                                v_extraQuota := v_extraQuota - v_lastQuota;
                                                --�����ֵ�����һ��Э��ۻ���
                                                if v_extraQuota >=0 then
                                                 /* ��һ��Э��۵����ȳ�ֵ��С���û���������� */
                                                      update org_remain_balance orb
                                                      set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                                                      where orb.user_id = userId
                                                      and orb.status=1
                                                      and orb.unit_price=v_unitprice;
                                                 --��ֵ�����һ�������Э������С
                                                elsif v_extraQuota <0 then
                                                    /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                                                    update org_remain_balance orb
                                                    set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                                                    where orb.user_id = userId
                                                    and orb.status=1
                                                    and orb.unit_price=v_unitprice;
                                                end if;

                                                exit when v_extraQuota <=0;
                                            end loop;
                                          end if;
                                        end;
                                  end if;

                             end if;
                    end if;
              end if;
        end if;

        --����ύ
        commit;
    end if;

    RUN_RESULT := 0;

   exception
       when others then
       RUN_RESULT := 1;
   rollback;

end insert_org_quota;
/

prompt
prompt Creating procedure P_CHECK_LONGSMS_SIGANATURE
prompt =============================================
prompt
create or replace procedure mc.p_check_longsms_siganature is
  --��ѯ���������һ������
  CURSOR send_cur IS
  SELECT *
         from send t
         where
              t.send_status = -1
              and rownum <= 5000
              and t.is_original_sms = 1
              and t.current_pageno = t.originalsms_totalpages;


  r_send            send%rowtype;
  
  TYPE              cur_rs IS REF CURSOR;
  c_sinature_pool   cur_rs;--���ǩ�����α�
  r_signature_pool  sgw_signature_pool%rowtype;

  v_msg_total             varchar2(2000);--ƴ�ӵ���Ϣ
  v_msg_count       number :=0;
  v_signature_ok    number :=0;
  v_has_total       number :=1; --�Ƿ������Ķ���
  v_send_id         varchar2(2000);

  errormessage      exception;
begin

  --���²���Ҫ����ǩ����У�������
  --update send t set t.send_status = 0 where t.send_status = -1 and t.charge = 1;
  --commit;

  open send_cur;

      --������
      loop
          fetch send_cur into r_send;

          v_msg_total    := '';
          v_msg_count    := 0;
          v_signature_ok := 0;
          v_has_total    := 1;
          v_send_id      := '';

          --��ѯ�������
          --ѭ����ƴ�Ӷ���
          FOR a_send IN (
                         select *
                                from send t
                                where     t.send_status = -1
                                      and t.mobile_to = r_send.mobile_to
                                      and t.longsms_tag = r_send.longsms_tag
                                 order by t.current_pageno )
          LOOP
              v_msg_count := v_msg_count + 1;

              --������������
              if v_msg_count != to_number(a_send.current_pageno) THEN
                 --��Ų�һ�£����Ƴ�ѭ����trigger
                 v_has_total := 0;
                 exit;
              end if;
              --ƴ�ӳ�����
              v_msg_total := v_msg_total||a_send.send_msg;
              if length(v_send_id) > 0 then
                   v_send_id := v_send_id||','||''''||a_send.send_id||'''';
              else
                   v_send_id := ''''||a_send.send_id||'''';
              end if;
          END LOOP;

          --����ƴ�ӳɳ�����
          if v_has_total = 1 and v_msg_count = r_send.originalsms_totalpages then
            --����Ƿ���ǩ����
            open c_sinature_pool for
                 select pool.*
                        from sgw_signature_pool pool
                        LEFT JOIN sgw_customer customer ON pool.customer_id = customer.customer_id
                                                       AND  customer.org_id= r_send.user_organization;
                loop
                    fetch c_sinature_pool into r_signature_pool;
                    exit when c_sinature_pool%notfound;
                          --��ǩ������
                          if instr(v_msg_total,r_signature_pool.signature,1,1) > 0 then
                             --���¶���״̬
                             --insert into SQL_LOG values(systimestamp, 'p_check_longsms_siganature sql', 'update send set send_status = 0 where send_id in (' || v_send_id || ')');
                             --commit;
                             if r_signature_pool.do_append_msg = 1 and length(r_send.send_msg||r_signature_pool.append_msg) <= 67 then
                                --execute immediate ('update send set send_status = 0, send_msg = ''' || (s.send_msg || r_signature_pool.append_msg) || ''' where send_id in (' || v_send_id || ')');
                                update send set send_msg = (r_send.send_msg||r_signature_pool.append_msg) where send_id = r_send.send_id;
                                execute immediate ('update send set send_status = 10 where send_id in (' || v_send_id || ')');
                                commit;
                             else
                               execute immediate ('update send set send_status = 10 where send_id in (' || v_send_id || ')');
                               commit;
                             end if;

                             v_signature_ok := 1;
                             --�˳�ѭ��
                             exit;
                          end if;
                end loop;
            close c_sinature_pool;

            --����ǩ�����У����޸Ķ���״̬
            if v_signature_ok = 0 then
               execute immediate ('update send set send_status = 6, report = ''UD:0000'',err_msg = ''����ǩ������ǩ����'' , report_time = sysdate where send_id in (' || v_send_id || ')');
               commit;
            end if;
          end if;
          exit when send_cur%notfound;
      end loop;
  close send_cur;

  --���³�ʱ�Ķ���,60����֮ǰ��
  update send t set t.send_status = 6, t.err_msg = '����ǩ����ʱ' where t.send_status = -1 and t.sys_time < (sysdate - 60/60/24);
  commit;
end p_check_longsms_siganature;
/

prompt
prompt Creating procedure P_MMS_CHANNEL_ANALYZE
prompt ========================================
prompt
create or replace procedure mc.P_MMS_CHANNEL_ANALYZE(p_date varchar2)
is
       v_sendTime date;--�濪ʼ����
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from mms_channel_analyze mca where mca.stat_time >= to_number ( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

        --  execute immediate v_del_SQL;
           --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ����
          -- commit;
           --Ԥͳ������ǰ���Ͷ�������

           v_child_SQL := ' select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, o.parentid as parent_org_id,ms.org_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >=''' || v_sendTime || ''' and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, ms.org_id as parent_org_id,ms.org_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >=''' || v_sendTime || ''' and o.parentid in (''0'',''1'')';

           while v_tempTime < trunc(sysdate)  loop
              v_curTableName := FUN_JXMDATE(to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));
            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, o.parentid as parent_org_id,ms.org_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, ms.org_id as parent_org_id,ms.org_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms  left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := ' ';
             end;
             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_tempTime := v_tempTime + 1;
           end loop;


             v_SQL := 'insert into mms_channel_analyze(channel_id,parent_org_id,org_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.channel_id, t.parent_org_id, t.org_id , send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t  group by t.channel_id,t.parent_org_id, t.org_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      else
             --ɾ�����췢�Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1-1/24/60/60;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXMDATE(p_date); -- p_date ��ʽ ��2012-11-08 14:00:00
            v_del_SQL :=  'delete from mms_channel_analyze mca where mca.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

           execute immediate v_del_SQL;
           commit;
           v_child_SQL := ' select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, o.parentid as parent_org_id, ms.org_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, ms.org_id as parent_org_id, ms.org_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid in (''0'',''1'')';

          while v_count < 30
          loop
              v_curTableName := FUN_JXDATE( to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));

            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, o.parentid as parent_org_id, ms.org_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, ms.org_id as parent_org_id, ms.org_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := '';
             end;

             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_count := v_count + 1;
             v_tempTime := v_tempTime + 1;
          end loop;

             v_SQL := 'insert into mms_channel_analyze(channel_id,parent_org_id,org_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.channel_id, t.parent_org_id,t.org_id , t.send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t where t.send_status in (1,5,6) group by t.channel_id, t.parent_org_id, t.org_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      end if;

end P_MMS_CHANNEL_ANALYZE;
/

prompt
prompt Creating procedure P_MMS_SEND_ANALYZE
prompt =====================================
prompt
create or replace procedure mc.P_MMS_SEND_ANALYZE(p_date varchar2)
is
       v_sendTime date;--�濪ʼ����
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from mms_send_analyze msa where msa.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

          execute immediate v_del_SQL;
           --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ����
          -- commit;
           --Ԥͳ������ǰ���Ͷ�������
           v_child_SQL := ' select to_number(to_char(send_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ms.org_id,ms.user_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id  where ms.send_status in (1,5,6) and ms.send_time >=''' || v_sendTime || ''' and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(send_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ms.org_id,ms.user_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id  where ms.send_status in (1,5,6) and ms.send_time >=''' || v_sendTime || ''' and o.parentid in (''0'',''1'')';

           while v_tempTime < trunc(sysdate)  loop
              v_curTableName := FUN_JXMDATE(to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));
            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ms.org_id,ss.user_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,ms.org_id as parent_org_id,ms.org_id,ms.user_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and o.parentid in (''0'',''1'')' ;
               Exception
                 when others then
                   v_SQL_TMP := ' ';
             end;
             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_tempTime := v_tempTime + 1;
           end loop;


             v_SQL := 'insert into mms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.parent_org_id,t.org_id, t.user_id,t.send_status, t.sysdat, sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t  group by t.parent_org_id,t.org_id,t.user_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      else
             --ɾ�����췢�Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1-1/24/60/60;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXMDATE(p_date); -- p_date ��ʽ ��2012-11-08 14:00:00
            v_del_SQL :=  'delete from mms_send_analyze msa where msa.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

           execute immediate v_del_SQL;
           commit;
           v_child_SQL := ' select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ms.org_id,ms.user_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,ms.org_id as parent_org_id,ms.org_id,ms.user_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid in (''0'',''1'')';
          while v_count < 30
          loop
              v_curTableName := FUN_JXMDATE( to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));

            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ms.org_id, ms.user_id, ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,ms.org_id as parent_org_id,ms.org_id, ms.user_id, ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := '';
             end;

             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_count := v_count + 1;
             v_tempTime := v_tempTime + 1;
          end loop;

             v_SQL := 'insert into mms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.parent_org_id, t.org_id, t.user_id, t.send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t where t.send_status in (1,5,6) group by t.parent_org_id,t.org_id, t.user_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      end if;

end P_MMS_SEND_ANALYZE;
/

prompt
prompt Creating procedure P_SEND_SMS_SUM
prompt =================================
prompt
create or replace procedure mc.P_SEND_SMS_SUM
is
user_id sms_send_analyze.user_id%type;--���͵��û�id
stat_time sms_send_analyze.stat_time%type;--��������
quantity sms_send_analyze.quantity%type;--���ŷ�������
org_id sms_send_analyze.org_id%type;--�û���������
cursor sms_cursor_result is select
 sum(MOBILE_QUANTITIES) quantity,
user_id,USER_ORGANIZATION as
 org_id,max(to_number(to_char(sysdate,'yyyymmdd')))
 as stat_time from send where sys_time<=sysdate
 and sys_time>trunc(sysdate,'dd') group by user_id,USER_ORGANIZATION;--ͳ�ƻ�������ķ�����
begin
if sms_cursor_result%isopen then--��ֹ�α��ϴ�δ�ر�
close sms_cursor_result;
end if;
open sms_cursor_result;
loop
fetch sms_cursor_result into quantity,user_id,org_id,stat_time;
exit when sms_cursor_result%notfound;
dbms_output.put_line('quantity:'||quantity||'user_id:'||user_id||'org_id:'||org_id||'stat_time:'||stat_time);
insert into sms_send_analyze(org_id,user_id,stat_time,status,quantity) values(org_id,user_id,stat_time,'1',quantity);
commit;
end loop;
close sms_cursor_result;


exception
 when others then
  rollback;

end P_SEND_SMS_SUM;
/

prompt
prompt Creating procedure P_SMS_CHANNEL_ANALYZE
prompt ========================================
prompt
create or replace procedure mc.P_SMS_CHANNEL_ANALYZE(p_date varchar2)
is
       v_sendTime date;--�濪ʼ����
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from sms_channel_analyze sca where sca.stat_time >= to_number ( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

          execute immediate v_del_SQL;
           --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ����
          -- commit;
           --Ԥͳ������ǰ���Ͷ�������

           v_child_SQL := ' select to_number(to_char(sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, o.parentid as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.longsms_splited = 0 and ss.send_status in (1,5,6) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.longsms_splited = 0 and ss.send_status in (1,5,6) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'' and o.parentid in (''0'',''1'')';

           while v_tempTime < trunc(sysdate)  loop
              v_curTableName := FUN_JXDATE(to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));
            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, o.parentid as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where ss.longsms_splited = 0 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss  left join organization o on ss.user_organization = o.user_id where ss.longsms_splited = 0 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := ' ';
             end;
             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_tempTime := v_tempTime + 1;
           end loop;


             v_SQL := 'insert into sms_channel_analyze(channel_id,parent_org_id,org_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.channel_id, t.parent_org_id, t.org_id , send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t  group by t.channel_id,t.parent_org_id, t.org_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      else
             --ɾ�����췢�Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXDATE(p_date); -- p_date ��ʽ ��2012-11-08 14:00:00
            v_del_SQL :=  'delete from sms_channel_analyze sca where sca.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

           execute immediate v_del_SQL;
           commit;
           v_child_SQL := ' select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, o.parentid as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.longsms_splited = 0 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';

          while v_count < 30
          loop
              v_curTableName := FUN_JXDATE( to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));

            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1  and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1  and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := '';
             end;

             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_count := v_count + 1;
             v_tempTime := v_tempTime + 1;
          end loop;

             v_SQL := 'insert into sms_channel_analyze(channel_id,parent_org_id,org_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.channel_id, t.parent_org_id,t.org_id , t.send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t where t.send_status in (0,1,5,6,7) group by t.channel_id, t.parent_org_id, t.org_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      end if;

end P_SMS_CHANNEL_ANALYZE;
/

prompt
prompt Creating procedure P_SMS_RETURN_CONSUME_FEE
prompt ===========================================
prompt
create or replace procedure mc.P_SMS_RETURN_CONSUME_FEE
       (
         p_batchId in varchar2,           --���κ�
         RUN_RESULT      OUT NUMBER,
         RUN_EXCEPTION   OUT VARCHAR
       )
is
       query_SQL varchar2(1000);    --��ѯ�Ʒѱ�sql
       update_SQL varchar2(1000);   --�޸��û����sql

       NO_BATCHID_RECORD exception;   --���κŲ������쳣

       NO_ORG_RECORD EXCEPTION; --����������

       NO_USER_RECORD EXCEPTION; --�û�������

       NO_PAY_MODE_RECORD EXCEPTION;  --�Ʒѵ�λ������

       NO_FEE_MODE_RECORD EXCEPTION;  --�۷ѷ�ʽ������

       TYPE My_CurType IS REF CURSOR;                              --�����α�����
       c_consume My_CurType;                                       --ָʾc_consume������ΪMy_CurType����My_CurType���α�����
       v_batchId consume_record_info.batch_id%type;                --���κ�id
       v_organizationId consume_record_info.organization_id%type;  --����id
       v_userId consume_record_info.consumer_id%type;              --�û�userId
       v_payMode organization.pay_mode%type;                       --�Ʒѵ�λ, 0:����, 1:����
       v_feeMode consume_record_info.fee_mode%type;                --�۷ѷ�ʽ, 0:�Ը���, 1:�鸶��
       v_costFee consume_record_info.cost_fee%type;                --�۷ѽ��
       v_sendQuantity consume_record_info.send_quantity%type;       --��������
begin
        update_SQL :='';

        query_SQL :='select cr.batch_id,
                         sum(nvl(cr.send_quantity,0)) send_quantity,
                         nvl(sum(cr.send_quantity*cr.unit_price),0) cost_fee,
                         cr.consumer_id userId,
                         cr.organization_id,
                         o.pay_mode,
                         cr.fee_mode
                    from consume_record_info cr
                    left join user_info u on u.user_id = cr.consumer_id
                    left join organization o on o.user_id = cr.organization_id';
        if p_batchId is null then
             RAISE NO_BATCHID_RECORD; --���κŲ�����ʱ�׳��쳣
        ELSE
             query_SQL := ' and cr.batch_id='''||p_batchId||'''';
        end if;
             query_SQL :='group by cr.batch_id,
                           cr.send_quantity,
                           nvl((cr.send_quantity*cr.unit_price),0),
                           cr.consumer_id,
                           cr.organization_id,
                           o.pay_mode,
                           cr.fee_mode
                          ';

        DBMS_OUTPUT.PUT_LINE(query_SQL);
     /*  --���Դ���:������ʱ���鿴sql
       insert into temp_table_test (CREATE_SQL, CREATE_TIME)values ('��ѯ�Ʒ��õ�sql'||query_SQL,sysdate);
     */

        if c_consume%isopen then --��ֹ�ϴ��α�δ�ر�
          close c_consume;
        end if;

        open c_consume for query_SQL;

        loop
          fetch c_consume into v_batchId,v_sendQuantity,v_costFee,v_userId,v_organizationId,v_payMode,v_feeMode; --��ȡ�α�
            exit when c_consume%notfound;

             --�쳣����
             if v_feeMode is null then
                RAISE NO_FEE_MODE_RECORD;
             end if;
             if v_payMode is null then
                RAISE NO_PAY_MODE_RECORD;
             end if;
             if v_organizationId is null then
                RAISE NO_ORG_RECORD;
             end if;
             if v_userId is null then
                RAISE NO_USER_RECORD;
             end if;

             --������鸶��
             if v_feeMode is not null and v_payMode is not null and v_organizationId is not null then
                if v_feeMode=1 then
                   --�����������,������������
                   if v_payMode=0 then
                       update_SQL :='update organization o
                          set o.user_quota = o.user_quota + '||v_sendQuantity||' where o.user_id = '''||v_organizationId||'''';
                   end if;
                   --����ǽ�����,���������
                   if v_payMode=1 then
                       update_SQL :='update organization o
                          set o.user_balance = o.user_balance + '||v_costFee||' where o.user_id = '''||v_organizationId||'''';
                   end if;
                end if;
            end if;

           --������Ը���
             if v_feeMode is not null and v_payMode is not null and v_userId is not null then
                if v_feeMode=0 then
                   --���������û�,������������
                   if v_payMode=0 then
                       update_SQL :='update user_info u
                          set u.user_quota = u.user_quota + '||v_sendQuantity||' where u.user_id = single_cursor.user_id';
                   end if;
                   --����ǽ���û�,���������
                   if v_payMode=1 then
                      update_SQL :='update user_info u
                         set u.user_balance = u.user_balance + '||v_costFee||' where u.user_id = single_cursor.user_id';
                   end if;
                 end if;
             end if;

            DBMS_OUTPUT.PUT_LINE(update_SQL);
         /*   --���Դ���:������ʱ���鿴sql
           insert into temp_table_test (CREATE_SQL, CREATE_TIME)values ('�޸ļƷ��õ�sql'||update_SQL,sysdate);
         */

            execute immediate update_SQL;
       end loop;

           commit;
           DBMS_OUTPUT.PUT_LINE('============���ط��óɹ�==========');
       close c_consume;

       exception
             when NO_BATCHID_RECORD then
                   DBMS_OUTPUT.PUT_LINE('���κ�Ϊ��');
                   RUN_RESULT    := 1;
                   RUN_EXCEPTION := '���κ�Ϊ��';
                   ROLLBACK;
             when NO_ORG_RECORD then
                   DBMS_OUTPUT.PUT_LINE('����������');
                   RUN_RESULT    := 2;
                   RUN_EXCEPTION := '����������';
                   ROLLBACK;
             when NO_USER_RECORD then
                   DBMS_OUTPUT.PUT_LINE('�û�������');
                   RUN_RESULT    := 3;
                   RUN_EXCEPTION := '�û�������';
                   ROLLBACK;
             when NO_PAY_MODE_RECORD then
                   DBMS_OUTPUT.PUT_LINE('�Ʒѵ�λ������');
                   RUN_RESULT    := 4;
                   RUN_EXCEPTION := '�Ʒѵ�λ������';
                   ROLLBACK;
             when NO_FEE_MODE_RECORD then
                   DBMS_OUTPUT.PUT_LINE('�۷ѷ�ʽ������');
                   RUN_RESULT    := 5;
                   RUN_EXCEPTION := '�۷ѷ�ʽ������';
                   ROLLBACK;
            WHEN OTHERS THEN
                   DBMS_OUTPUT.PUT_LINE(SQLCODE || '----' || SQLERRM);
                   RUN_RESULT    := 6;
                   RUN_EXCEPTION := SQLCODE || '----' || SQLERRM;
                   ROLLBACK;

end P_SMS_RETURN_CONSUME_FEE;
/

prompt
prompt Creating procedure P_SMS_RETURN_FEE
prompt ===================================
prompt
create or replace procedure mc.P_SMS_RETURN_FEE is
   cursor c_consume is
        select sum(s1.unit_price*s1.mobile_quantities) failTotalFee,
                   sum(s1.mobile_quantities) failTotalQuata,
                   s1.user_id,
                   s1.unit_price,
                   to_char(s1.send_time, 'yyyymmdd') send_time,
                   o.fee_mode,
                   o.parentid,
                   u.organization_id
              from send s1
              left join user_info u on s1.user_id = u.user_id
              left join organization o on s1.user_organization = o.user_id
              left join channel_info c on s1.channel_id = c.channel_id
              left join task_info ti on ti.batch_id=s1.batch_id
             where 1=1
               and s1.sys_time <=CAST(sysdate AS TIMESTAMP)
               and s1.sys_time >=CAST(trunc(sysdate)-3 AS TIMESTAMP)
               --and s1.receive_id is null                        -- ��CMPP�ӿڹ����Ķ���
               and s1.send_status = 6                           --��������:����ʧ��
               and (s1.return_fee=0 or s1.return_fee is null)   --���ط���:δ���ط���
               and o.deduct_mode=1                              --�Ʒ�����:�ɹ��Ʒ�
               and o.pay_type=0                                 --��ֵ����:Ԥ����
               and (s1.msg_type =any('common','batch','template','vercode') and  ti.time_task=0 or s1.msg_type =any('http','webservice'))     --�Ƿ�ʱ����0���� 1��
               and ((s1.is_original_sms=0 and c.link_mode != all('CMPP2','SGIP','SMGP3')) or (s1.mobile_quantities=1 and c.link_mode = any('CMPP2','SGIP','SMGP3')))
             group by s1.user_id,s1.unit_price,to_char(s1.send_time, 'yyyymmdd'), o.fee_mode,o.parentid, u.organization_id
         union all
         select sum(s1.unit_price*s1.mobile_quantities) failTotalFee,
                   sum(s1.mobile_quantities) failTotalQuata,
                   s1.user_id,
                   s1.unit_price,
                   to_char(s1.send_time, 'yyyymmdd') send_time,
                   o.fee_mode,
                   o.parentid,
                   u.organization_id
              from send s1
              left join user_info u on s1.user_id = u.user_id
              left join organization o on s1.user_organization = o.user_id
              left join channel_info c on s1.channel_id = c.channel_id
              left join task_info ti on ti.batch_id=s1.batch_id
             where 1=1
               and s1.send_time <=CAST(sysdate AS TIMESTAMP)
               and s1.send_time >=CAST(trunc(sysdate)-3 AS TIMESTAMP)
               --and s1.receive_id is null                        -- ��CMPP�ӿڹ����Ķ���
               and s1.send_status = 6                           --��������:����ʧ��
               and (s1.return_fee=0 or s1.return_fee is null)   --���ط���:δ���ط���
               and o.deduct_mode=1                              --�Ʒ�����:�ɹ��Ʒ�
               and o.pay_type=0                                 --��ֵ����:Ԥ����
               and ti.time_task=1                               --�Ƿ�ʱ����0���� 1��
               and ((s1.is_original_sms=0 and c.link_mode != all('CMPP2','SGIP','SMGP3')) or (s1.mobile_quantities=1 and c.link_mode = any('CMPP2','SGIP','SMGP3')))
             group by s1.user_id,s1.unit_price,to_char(s1.send_time, 'yyyymmdd'), o.fee_mode,o.parentid, u.organization_id;

      single_cursor c_consume%rowtype;
      v_payMode organization.pay_mode%type;                     --�û������������Ʒѵ�λ, 0:����, 1:����
      orgCount number;                                          --��ѯ��������Ƿ��Ѿ���������

begin
      if c_consume%isopen then
         close c_consume;
      end if;

      open c_consume;
           loop
             fetch c_consume into single_cursor;
               exit when c_consume%notfound;
               --DBMS_OUTPUT.PUT_LINE(single_cursor.user_id||'--'||nvl(single_cursor.failTotalFee,0)||'---'||single_cursor.fee_mode);
                --��ѯ���û��������ļƷѵ�λ, 0:����, 1:����
                if single_cursor.organization_id != '1' then
                    SELECT o.pay_mode into v_payMode
                    FROM organization o
                    where o.parentid='1'
                    START WITH o.user_id=(select u.organization_id from user_info u where u.user_id=single_cursor.user_id)
                    CONNECT BY PRIOR o.parentid=o.user_id;
                else
                    select o.pay_mode into v_payMode from organization o
                    where o.user_id=single_cursor.organization_id;
                end if;

               --DBMS_OUTPUT.PUT_LINE(single_cursor.user_id||'--'||nvl(single_cursor.failTotalFee,0)||'---'||single_cursor.fee_mode);
               --������Ը���
               if single_cursor.fee_mode is not null and single_cursor.user_id is not null then
                 if single_cursor.fee_mode=0 then
                   --����������û����ǽ���û�,��������������
                       update user_info u
                          set u.user_quota = u.user_quota + nvl(single_cursor.failTotalQuata,0)
                        where u.user_id = single_cursor.user_id;
                      /* �޸�����,������������Ը��ѣ����������û���������
                       * ��������µ��ӻ����������Ը��ѣ�ҲҪ��������
                       */
                      if v_payMode = 1 then
                          --��ѯ�û��Ƿ������Э��۵����
                          select count(1) into orgCount
                          from org_remain_balance orb
                          where orb.user_id = single_cursor.user_id
                          and orb.unit_price =single_cursor.unit_price
                          and orb.status=1;
                          --�д�Э������������
                          if orgCount>0 then
                            update org_remain_balance orb
                            set orb.sms_quota = orb.sms_quota + nvl(single_cursor.failTotalQuata,0),
                            orb.last_update_quota_date = sysdate,orb.update_user='SYS_JOB_RETURN_FEE'
                            where orb.user_id = single_cursor.user_id
                            and orb.unit_price =single_cursor.unit_price;
                          --û�д�Э������������
                          elsif orgCount=0 then
                             insert into org_remain_balance
                             (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                             values
                             (sys_guid(), single_cursor.user_id,1, nvl(single_cursor.failTotalQuata,0), single_cursor.unit_price,0, sysdate, 'SYS_JOB_RETURN_FEE', '�����û����ò�������', sysdate, 0,0);
                          end if;
                      end if;
                 end if;
               end if;

               --������鸶��
               if single_cursor.fee_mode is not null and v_payMode is not null then
                  if single_cursor.fee_mode=1 then
                     --����(�ֽ���������������)
                     if single_cursor.parentid = '1' or single_cursor.parentid = '0' then
                          --�����������,������������
                         if v_payMode=0 then
                             update organization o
                                set o.user_quota = o.user_quota + nvl(single_cursor.failTotalQuata,0)
                              where o.user_id = single_cursor.organization_id;
                         end if;
                         --����ǽ�����,���������
                         if v_payMode=1 then
                             update organization o
                                set o.user_balance = o.user_balance + nvl(single_cursor.failTotalFee,0)
                              where o.user_id = single_cursor.organization_id;
                         end if;
                     --�����������ӻ�����ȫ����ֱ�ӷ���������
                     elsif single_cursor.parentid != '1' and single_cursor.parentid != '0' then
                         --�Ժ�۷�ʱ������������������������ã���������ֻ�ǲ鿴������
                         update organization o
                         set o.user_quota = o.user_quota + nvl(single_cursor.failTotalQuata,0)
                         where o.user_id = single_cursor.organization_id;

                         /*��������������ӻ���������������*/

                         if v_payMode=1 then
                            --��ѯ�û��Ƿ������Э��۵����
                            select count(1) into orgCount
                            from org_remain_balance orb
                            where orb.user_id = single_cursor.organization_id
                            and orb.unit_price =single_cursor.unit_price
                            and orb.status=1;
                            --�д�Э������������
                            if orgCount>0 then
                              update org_remain_balance orb
                              set orb.sms_quota = orb.sms_quota + nvl(single_cursor.failTotalQuata,0),
                              orb.last_update_quota_date = sysdate,orb.update_user='SYS_JOB_RETURN_FEE'
                              where orb.user_id = single_cursor.organization_id
                              and orb.unit_price =single_cursor.unit_price;
                            --û�д�Э������������
                            elsif orgCount=0 then
                               insert into org_remain_balance
                               (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                               values
                               (sys_guid(), single_cursor.organization_id,1, nvl(single_cursor.failTotalQuata,0), single_cursor.unit_price,0, sysdate, 'SYS_JOB_RETURN_FEE', '���ػ������ò�������', sysdate, 1,0);
                            end if;
                         end if;
                     end if;


                  end if;
              end if;

              --�޸Ķ���״̬Ϊ:�ѷ�����
               update send s set s.return_fee=1 where s.send_id in
                 (select s1.send_id
                      from send s1
                      left join user_info u on s1.user_id = u.user_id
                      left join organization o on s1.user_organization = o.user_id
                      left join channel_info c on s1.channel_id = c.channel_id
                     where to_char(s1.send_time, 'yyyymmdd') =single_cursor.send_time
                       and s1.user_id=single_cursor.user_id
                       and s1.receive_id is null                        -- ��CMPP�ӿڹ����Ķ���
                       and s1.send_status = 6                           --��������:����ʧ��
                       and o.deduct_mode=1                              --�Ʒ�����:�ɹ��Ʒ�
                       and o.pay_type=0                                 --��ֵ����:Ԥ����
                       --and s1.deduct_fee_status !=0                      --�۷�״̬:�ɹ�
                       and ((s1.is_original_sms=0 and c.link_mode != all('CMPP2','SGIP','SMGP3'))
                       or (s1.mobile_quantities=1 and c.link_mode = any('CMPP2','SGIP','SMGP3'))));

                --�����ֵ��¼��
                 --������鸶��
                 if single_cursor.fee_mode=1 then
                     --����
                     if single_cursor.parentid = '1' or single_cursor.parentid = '0' then
                          --�����������,������������
                         if v_payMode=0 then
                              insert into payment_record
                              (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA,OPERATOR_ID, PAYMENT_TYPE,IS_ONLINE, USER_TYPE,RECHARGE_EXPLAIN,QUOTA_TYPE,IS_SUCCESS)
                              values
                              (sys_guid(), single_cursor.organization_id,sysdate,0, nvl(single_cursor.failTotalQuata,0), 'SYS_JOB_RETURN_FEE', 6, 0,1, '��������ʧ�ܶ������',1, 1);
                         end if;
                         --����ǽ�����,���������
                         if v_payMode=1 then
                              insert into payment_record
                              (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA,OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE,IS_SUCCESS)
                              values
                              (sys_guid(),single_cursor.organization_id,sysdate, nvl(single_cursor.failTotalFee,0), 0, 'SYS_JOB_RETURN_FEE', 7, 0, 1, '��������ʧ�ܶ��Ž��',1, 1);
                         end if;
                     --�����������ӻ�����ȫ����ֱ�ӷ���������
                     elsif single_cursor.parentid != '1' and single_cursor.parentid != '0' then
                             insert into payment_record
                             (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA,OPERATOR_ID, PAYMENT_TYPE,IS_ONLINE, USER_TYPE,RECHARGE_EXPLAIN,QUOTA_TYPE,IS_SUCCESS)
                             values
                             (sys_guid(), single_cursor.organization_id,sysdate,0, nvl(single_cursor.failTotalQuata,0), 'SYS_JOB_RETURN_FEE', 6, 0,1, '��������ʧ�ܶ������',1, 1);
                     end if;
               end if;

               --������Ը���
               if single_cursor.fee_mode=0 then
                  insert into payment_record
                          (PAYMENT_ID,
                           USER_ID,
                           PAYMENT_TIME,
                           PAYMENT_MONEY,
                           PAYMENT_QUOTA,
                           OPERATOR_ID,
                           PAYMENT_TYPE,
                           IS_ONLINE,
                           USER_TYPE,
                           RECHARGE_EXPLAIN,
                           QUOTA_TYPE,
                           IS_SUCCESS)
                        values
                          (sys_guid(),
                           single_cursor.user_id,
                           sysdate,
                           0,
                           nvl(single_cursor.failTotalQuata,0),
                           'SYS_JOB_RETURN_FEE',
                           6,
                           0,
                           0,
                           '��������ʧ�ܶ������',
                           1,
                           1);
               end if;

            end loop;

            commit;

      close c_consume;

   exception
       when others then
   rollback;
end P_SMS_RETURN_FEE;
/

prompt
prompt Creating procedure P_SMS_SEND_ANALYZE
prompt =====================================
prompt
create or replace procedure mc.P_SMS_SEND_ANALYZE(p_date varchar2)
is
       v_sendTime date;--�濪ʼ����
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from sms_send_analyze ssa where ssa.stat_time >= to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

          execute immediate v_del_SQL;
           --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ����
          -- commit;
           --Ԥͳ������ǰ���Ͷ�������

           v_child_SQL := ' select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id  where  ss.MOBILE_QUANTITIES = 1  and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id  where  ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';

           while v_tempTime < trunc(sysdate)  loop
              v_curTableName := FUN_JXDATE(to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));
            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where  ss.MOBILE_QUANTITIES = 1  and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where  ss.MOBILE_QUANTITIES = 1  and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')' ;
               Exception
                 when others then
                   v_SQL_TMP := ' ';
             end;
             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_tempTime := v_tempTime + 1;
           end loop;


             v_SQL := 'insert into sms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.parent_org_id,t.org_id, t.user_id,t.send_status, t.sysdat, sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t  group by t.parent_org_id,t.org_id,t.user_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      else
             --ɾ�����췢�Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXDATE(p_date); -- p_date ��ʽ ��2012-11-08 14:00:00
            v_del_SQL :=  'delete from sms_send_analyze ssa where ssa.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

           execute immediate v_del_SQL;
           commit;
           v_child_SQL := ' select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';
          while v_count < 30
          loop
              v_curTableName := FUN_JXDATE( to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));

            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.org_id, ss.user_id, ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o  where ss.MOBILE_QUANTITIES = 1 and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.org_id as parent_org_id,ss.org_id, ss.user_id, ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o  where ss.MOBILE_QUANTITIES = 1 and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := '';
             end;

             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_count := v_count + 1;
             v_tempTime := v_tempTime + 1;
          end loop;

             v_SQL := 'insert into sms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.parent_org_id, t.org_id, t.user_id, t.send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t where t.send_status in (0,1,5,6,7) group by t.parent_org_id,t.org_id, t.user_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      end if;

end P_SMS_SEND_ANALYZE;
/

prompt
prompt Creating procedure P_SMS_UPDATE_TASKINFO
prompt ========================================
prompt
create or replace procedure mc.P_SMS_UPDATE_TASKINFO is
   cursor c_consume is
         select aa.batch_id,
                sum(nvl(aa.successQuota,0)) successQuota,
                sum(nvl(aa.failureQuota,0)) failureQuota,
                sum(nvl(aa.unkownQuota,0)) unkownQuota
                 from (select s.batch_id,
                              (case when s.send_status=5 then nvl(sum(s.mobile_quantities),0)
                               end) successQuota,
                               (case when s.send_status=6 then nvl(sum(s.mobile_quantities),0)
                               end) failureQuota,
                               (case when s.send_status=1 then nvl(sum(s.mobile_quantities),0)
                               end) unkownQuota
                             from send s
                             left join task_info t on t.batch_id = s.batch_id
                             left join channel_info c on s.channel_id = c.channel_id 
                            where s.sys_time >= CAST(trunc(sysdate)-2 AS TIMESTAMP)
                              and s.sys_time <= CAST(sysdate AS TIMESTAMP)
                              and ((c.link_mode != all('CMPP2','SGIP','SMGP3') and s.is_original_sms=0)  
                                     or (c.link_mode = any('CMPP2','SGIP','SMGP3') and s.mobile_quantities=1))
                group by s.batch_id,s.send_status) aa
                group by aa.batch_id;      

   single_cursor c_consume%rowtype;
   allCount task_info.report_all_count%type;

begin
     allCount :=0;

     if c_consume%isopen then
         close c_consume;
      end if;

      open c_consume;
           loop
             fetch c_consume into single_cursor;
               exit when c_consume%notfound;

               --���㷵��״̬�����������
               allCount := nvl(single_cursor.successQuota,0)+nvl(single_cursor.failurequota,0)+nvl(single_cursor.unkownquota,0);

               --�޸�task_info����״̬���������
               update task_info t set
                 t.report_all_count=allCount,
                 t.report_success_count=nvl(single_cursor.successQuota,0),
                 t.report_failure_count=nvl(single_cursor.failurequota,0),
                 t.report_unknown_count=nvl(single_cursor.unkownquota,0)
               where t.batch_id=single_cursor.batch_id;

           end loop;

            commit;

      close c_consume;

     exception
         when others then
     rollback;

end P_SMS_UPDATE_TASKINFO;
/

prompt
prompt Creating procedure P_STATICS_SMSQUANTITY
prompt ========================================
prompt
create or replace procedure mc.p_statics_smsquantity
 is
begin
  --ɾ��ԭ������
  delete from send_statics_quantity_temp;
  commit;
  --ͳ�Ƹ���ͨ�����ŷ�������
  insert into send_statics_quantity_temp
          select channel_id,
                 SUM(mobile_quantities) as total_quantity,
                 SUM( DECODE ( send_status, 0, mobile_quantities, 0 )) wait_send_quantity,
                 SUM( DECODE ( send_status, 2, mobile_quantities, 0 )) sending_quantity,
                 SUM( DECODE ( send_status, 1, mobile_quantities, 0 )) sent_quantity,
                 SUM( DECODE ( send_status, 5, mobile_quantities, 0 )) success_quantity,
                 SUM( DECODE ( send_status, 6, mobile_quantities, 0 )) failed_quantity,
                 SUM( DECODE ( send_status, 7, mobile_quantities, 0 )) black_quantity,
                 SUM( DECODE ( send_status, 8, mobile_quantities, 0 )) prohibited_quantity,
                 0 receive_quantity,
                 sysdate as create_time
          from  send t
          where sys_time = to_timestamp(to_date(SYSDATE,'yyyymmdd'))
                and t.is_original_sms = 0
          group by channel_id
          order by channel_id
  ;

  --ͳ�ƶ��Ž�������
  update send_statics_quantity_temp q set q.receive_quantity =
  (
  select count(*) receive_quantity from sms_receive t
  where  1=1
         --and trunc(sys_time) = to_date(theDate, 'yyyy-MM-dd')
         and trunc(sys_time) = trunc(sysdate)
         and t.channel_id = q.channel_id
  group by channel_id
  )
  ;

  --����û�з�������ͨ��������
  insert into send_statics_quantity_temp t
  select channel_id,
         0 total_quantity,
         0 wait_send_quantity,
         0 sending_quantity,
         0 sent_quantity,
         0 success_quantity,
         0 failed_quantity,
         0 black_quantity,
         0 prohibited_quantity,
         count(*) receive_quantity,
         sysdate as create_time
  from sms_receive q
  where  1=1
         --and trunc(sys_time) = to_date(theDate, 'yyyy-MM-dd')
         and trunc(sys_time) = trunc(sysdate)
         and q.channel_id not in
         (
             select distinct channel_id from send_statics_quantity_temp
         )
  group by channel_id
  ;
  --���㷢���ܺ�
  insert into send_statics_quantity_temp
          select -1 channel_id,
                 sum(total_quantity) total_quantity,
                 sum(wait_send_quantity) wait_send_quantity,
                 sum(sending_quantity) sending_quantity,
                 sum(sent_quantity) sent_quantity,
                 sum(success_quantity) success_quantity,
                 sum(failed_quantity) failed_quantity,
                 sum(black_quantity) black_quantity,
                 sum(prohibited_quantity) prohibited_quantity,
                 sum(receive_quantity) receive_quantity,
                 sysdate as create_time
          from send_statics_quantity_temp t
  ;
  --��������ܺ�
  update send_statics_quantity_temp set receive_quantity =
  (
         select sum(receive_quantity) from send_statics_quantity_temp where channel_id != -1
  )
  where channel_id = -1;

  --�����������¼�¼
  insert into send_statics_quantity select * from send_statics_quantity_temp;
  commit;
end p_statics_smsquantity;
/

prompt
prompt Creating procedure QUERY_MMS_CHANNEL
prompt ====================================
prompt
create or replace procedure mc.QUERY_MMS_CHANNEL(
                  p_startTime in varchar2,--��ʼʱ�䣨������) 2012-12-13
                  p_endTime in varchar2,--����ʱ�� ��������) 2012-12-13
                  p_statType in number, -- ͳ������ 0   ��������Աͨ��ͳ�ƣ�1  ��ͨ����Աͨ��ͳ��
                  p_channelID in varchar2,--ͨ��ID   1,2,3,....n ������ʽ
                  p_orgID in varchar2,--����ID �������
                  p_status in varchar2,--״̬
                  mycursor out sys_refcursor--���ؽ�����α�
                 )
is
       v_startTime number(8);--�濪ʼ����
       v_endTime number(8);--���������
       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --�����ѯ��ʼ����
     if p_startTime is not null  then 
             v_startTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;
     if p_endTime is not null then
             v_endTime :=to_number( to_char(to_date(p_endTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;
     
     if v_startTime != 0 and v_endTime != 0 and v_startTime > v_endTime then
        v_startTime := v_endTime;
        v_endTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;
     
     if v_debug = 1 then
       DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime );
       DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime );
     end if;
     if p_statType = 0 then --��������ͨ��ͳ��
           v_SQL := 'select c.channel_name,o.user_name,mca.status,sum(mca.quantity) from mms_channel_analyze mca
                     left join channel_info c on mca.channel_id = c.channel_id
                          left join organization o on mca.parent_org_id = o.user_id
                   where 1 = 1' ;

           if p_channelID is not null then
               v_SQL := v_SQL || ' and mca.channel_id = ' || p_channelID ;
           end if;
           if v_startTime > 0 then
               v_SQL := v_SQL || ' and mca.stat_time >= ' || v_startTime ;
           end if;

           if v_endTime > 0 then
               v_SQL := v_SQL || ' and mca.stat_time <= ' || v_endTime ;
           end if ;

           if p_status is not null then
              v_SQL := v_SQL || ' and mca.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by c.channel_name,o.user_name,mca.status';
      else
              v_SQL := 'select c.channel_name,o.user_name,mca.status,sum(mca.quantity) from mms_channel_analyze mca
                       left join channel_info c on mca.channel_id = c.channel_id
                            left join organization o on mca.org_id = o.user_id
                     where  mca.parent_org_id = ''' || p_orgID || '''' ;

           if p_channelID is not null then
               v_SQL := v_SQL || ' and mca.channel_id = ' || p_channelID ;
           end if;

           if v_startTime > 0 then
               v_SQL := v_SQL || ' and mca.stat_time >= ' || v_startTime ;
           end if;

           if v_endTime > 0 then
               v_SQL := v_SQL || ' and mca.stat_time <= ' || v_endTime ;
           end if ;

           if p_status is not null then
              v_SQL := v_SQL || ' and mca.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by c.channel_name,o.user_name,mca.status';
      end if;

     --ƴִ��SQL��ʼ

      DBMS_OUTPUT.PUT_LINE('v_SQL = ' || v_SQL);

     open mycursor for v_SQL ;

end QUERY_MMS_CHANNEL;
/

prompt
prompt Creating procedure QUERY_MMS_SEND
prompt =================================
prompt
create or replace procedure mc.QUERY_MMS_SEND(
               p_startTime in varchar2,--��ʼʱ�䣨������)
                  p_endTime in varchar2,--����ʱ�� ��������)
                  p_statType in number, -- ͳ������ 0 һ�����ͳ�ƣ�1 ������������ͳ�� 2 ��������Ա����ͳ��
                  p_userID in varchar2,--����ID Admin ������
                  p_parentOrgID in varchar2,--����ID ������
                  p_orgID in varchar2,--����ID �������
                  p_status in varchar2, --״̬
                  mycursor out sys_refcursor--���ؽ�����α�
                 )
is
       v_startTime number(8);--�濪ʼ����
       v_endTime number(8);--���������
       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --�����ѯ��ʼ����
     if p_startTime is not null  then 
             v_startTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;
     if p_endTime is not null then
             v_endTime :=to_number( to_char(to_date(p_endTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;
     
     if v_startTime != 0 and v_endTime != 0 and v_startTime > v_endTime then
        v_startTime := v_endTime;
        v_endTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;

     if v_debug = 1 then
       DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime );
       DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime );
     end if;
     --ƴִ��SQL��ʼ
     if p_statType = 0  then --һ�����ͳ��
          v_SQL := 'select u.user_name,msa.status,sum(msa.quantity) from mms_send_analyze msa
                     left join user_info u on msa.user_id = u.user_id
                   where msa.org_id  = ''' || p_orgID || '''' ;
           if p_userID is not null then
              v_SQL := v_SQL || ' and msa.user_id = ''' || p_userID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and msa.status in (' || p_status || ')';
           end if;

           if v_startTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time >= ' || v_startTime ;
           end if;

           if v_endTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time <= ' || v_endTime ;
           end if ;

           v_SQL := v_SQL || ' group by u.user_name,msa.status';
      end if;

      if p_statType = 1  then --��������ͳ��
          v_SQL := 'select o.user_name,msa.status,sum(msa.quantity) from mms_send_analyze msa
                          left join organization o on msa.org_id = o.user_id
                   where msa.parent_org_id  = ''' || p_parentOrgID || '''' ;

           if p_orgID is not null then
               v_SQL := v_SQL || ' and msa.org_id = ''' || p_orgID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and msa.status in (' || p_status || ')';
           end if;

           if v_startTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time >= ' || v_startTime ;
           end if;

           if v_endTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time <= ' || v_endTime ;
           end if ;

           v_SQL := v_SQL || ' group by o.user_name,msa.status';
      end if;

      if p_statType = 2  then --��������Ա����ͳ��
          v_SQL := 'select o.user_name,msa.status,sum(msa.quantity) from mms_send_analyze msa
                          left join organization o on msa.parent_org_id = o.user_id
                   where 1= 1 ' ;
           if p_orgID is not null then
              v_SQL := v_SQL || ' and msa.parent_org_id = ''' || p_orgID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and msa.status in (' || p_status || ')';
           end if;

           if v_startTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time >= ' || v_startTime ;
           end if;

           if v_endTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time <= ' || v_endTime ;
           end if ;

           v_SQL := v_SQL || ' group by o.user_name,msa.status';
      end if;

     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;

end QUERY_MMS_SEND;
/

prompt
prompt Creating procedure QUERY_MONTH_INFO_REPORT
prompt ==========================================
prompt
create or replace procedure mc.QUERY_MONTH_INFO_REPORT
     (
       p_queryTime in varchar2,          --��ѯ�·ݣ�����)
       p_statType in number,             -- ��ѯ���� 2 һ�������ѯ��1 ����������ѯ 0 ��������Ա��ѯ
       p_orgID in varchar2,              --����ID �������
       p_userID in varchar2,             --�û�ID Admin ������
       p_userOrgId in varchar2,          --�û�����(��user�������)
       mycursor out sys_refcursor       --���ؽ�����α�
      )
 is
       v_debug number(1);                          --�Ƿ�������Ϣ, 0:���� ��1����
       v_SQL varchar2(8000);                       -- ƴ�ӵĻ���SQL
begin
       v_SQL := '';
       v_debug := 0;

        v_SQL := 'select mri.user_id,
                       ui.user_name,
                       o.user_name org_name,
                       mri.account_time,
                       sum(mri.send_quantity) send_quantity,
                       sum(mri.cost_fee) cost_fee
                  from month_reckoning_info mri
                  left join user_info ui on ui.user_id=mri.user_id
                  left join organization o on o.user_id=ui.organization_id
                  where 1=1
                  ';

       if p_statType = 1  then   --��������ͳ��
           --���������ѯ����Ϊ�գ�Ĭ����ʾ������������Ա
           if p_orgID is null then
                 v_SQL := v_SQL || ' and (o.parentid='''||p_userOrgId||''' or o.user_id='''|| p_userOrgId || ''')';
           end if;

           if p_userID is not null then
               v_SQL := v_SQL || ' and mri.user_id= '''|| p_userID || '''';
           end if;
           --��ѯ�������գ���ʾ��ѯ��������Ա
           if p_orgID is not null then
                 v_SQL := v_SQL || ' and ui.organization_id='''|| p_orgID || '''';
           end if;

           if p_queryTime is not null then
               v_SQL := v_SQL || ' and mri.ACCOUNT_TIME = ' || p_queryTime;
           end if;

      end if;

         if p_statType = 0  then --��������Ա����ͳ��

           if p_userID is not null then
               v_SQL := v_SQL || ' and mri.user_id= '''|| p_userID || '''';
           end if;

           if p_orgID is not null then
                 v_SQL := v_SQL || ' and ui.organization_id='''|| p_orgID || '''';
           end if;

           if p_queryTime is not null then
               v_SQL := v_SQL || ' and mri.ACCOUNT_TIME = ' || p_queryTime;
           end if;

      end if;

      v_SQL := v_SQL||' group by mri.user_id,ui.user_name,o.user_name,mri.account_time order by mri.ACCOUNT_TIME desc';
     --���Դ���:������ʱ���鿴sql

     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;

end QUERY_MONTH_INFO_REPORT;
/

prompt
prompt Creating procedure QUERY_ORGSMS_MANAGER_AND_TIME
prompt ================================================
prompt
create or replace procedure mc.QUERY_ORGSMS_MANAGER_AND_TIME(p_date in varchar2,p_cm in varchar2,mycursor out sys_refcursor,p_pageSize number,p_page number,p_count out number,user_type in varchar2)
is
v_sql varchar2(1000);
v_time number(8);
v_id varchar2(100);
p_customer_manager varchar2(100);
begin
p_customer_manager := ''''||p_cm||'''';
if user_type = '1' then
v_id := 'o.parentid =';
select count(o.user_id) into p_count from organization o where o.parentid=p_cm and o.user_stat=1;
else
v_id :='o.customer_manager_id =';
select count(o.user_id) into p_count from organization o where o.customer_manager_id=p_cm and o.user_stat=1 ;
end if;
v_time:= to_number(to_char(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
v_sql:='select t2.* from (select rownum r,o.user_name,o.user_id,us.nick_name,o.customer_manager_id,o.pay_mode,o.user_quota,o.mms_quota,o.user_balance,orgconfig.company_tel,(select vd.quantity from  v_sms_analyze vd where o.user_id = vd.org_id and vd.stat_time ='''||v_time||''' ) as quantity
 from organization o
 left join org_config orgconfig on orgconfig.organization_id = o.user_id left join user_info us on o.customer_manager_id = us.user_id
 where '||v_id||p_customer_manager||' and  rownum<='||p_page||'*'||p_pageSize||' and o.user_stat=1) t2 where t2.r>('||p_page||'-1)*'||p_pageSize||'';
dbms_output.put_line('v_sql:'||v_sql);
open mycursor for v_sql;
exception
when others then
dbms_output.put_line('error:'||sqlcode||':'||sqlerrm);
end QUERY_ORGSMS_MANAGER_AND_TIME;
/

prompt
prompt Creating procedure QUERY_PRICIPAL_SMS_SEND
prompt ==========================================
prompt
create or replace procedure mc.QUERY_PRICIPAL_SMS_SEND(
                  p_startTime in varchar2,--��ʼʱ�䣨������)
                  p_endTime in varchar2,--����ʱ�� ��������)
                  p_statType in number, -- ͳ������ 2 һ�����ͳ�ƣ�1 ������������ͳ�� 0 ��������Ա����ͳ�� 3 ί����ͳ��
                  p_userID in varchar2,--ί����

                  p_status in varchar2,-- ״̬
                  p_operatorID in varchar2, --ʵ�ʲ�����
                  mycursor out sys_refcursor--���ؽ�����α�
                 )
is
       v_startTime number(8);--�濪ʼ����
       v_endTime number(8);--���������
       v_char_startTime number(8);--�濪ʼ����
       v_char_endTime number(8);--���������

       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
       v_subSQL varchar2(8000);
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --�����ѯ��ʼ����
    if p_startTime is not null  then
             v_startTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
             v_char_startTime := to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD');
     end if;
     if p_endTime is not null then
             v_endTime :=to_number( to_char(to_date(p_endTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
             v_char_endTime   := to_char(to_date(p_endTime,  'yyyy-MM-dd hh24:mi:ss') + 1,'YYYYMMDD');
     end if;

     if v_startTime != 0 and v_endTime != 0 and v_startTime > v_endTime then
        v_startTime := v_endTime;
        v_endTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
        v_char_endTime   := to_char(to_date(p_endTime,  'yyyy-MM-dd hh24:mi:ss') + 1,'YYYYMMDD');
     end if;

     if v_debug = 1 then
       DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime );
       DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime );
     end if;

      if p_statType = 3  then --ί����ͳ��
          v_subSQL := '
          SELECT T.PARENT_ORG_ID,
                 T.ORG_ID,
                 T.OPERATOR_ID,
                 T.USER_ID,
                 T.SEND_STATUS AS STATUS,
                 T.SYSDAT,
                 T.GRANTER_ID,
                 SUM(MOBILE_QUANTITIES) AS QUANTITY
            FROM (
                   --��ͨ����ѯ
                   SELECT  SYS_TIME AS SYSDAT,
                           O.PARENTID AS PARENT_ORG_ID,
                           SS.USER_ORGANIZATION AS ORG_ID,
                           SS.OPERATOR_ID,
                           SS.USER_ID,
                           SS.SEND_STATUS,
                           SS.MOBILE_QUANTITIES,
                           TI.GRANTER_ID
                      FROM SEND SS
                      LEFT JOIN ORGANIZATION O ON SS.USER_ORGANIZATION = O.USER_ID
                      LEFT JOIN USER_INFO U ON U.USER_ID=SS.OPERATOR_ID and U.USER_ID=SS.USER_ID
                      LEFT JOIN CHANNEL_INFO C ON SS.CHANNEL_ID = C.CHANNEL_ID
                      LEFT JOIN TASK_INFO TI ON TI.BATCH_ID=SS.BATCH_ID AND SS.USER_ID=TI.GRANTER_ID
                     WHERE 1=1
                           AND TI.GRANTER_ID IS NOT NULL
                           AND SS.SYS_TIME >= TO_DATE(''' || v_char_startTime || ''', ''yyyy-MM-dd hh24:mi:ss'')
                           AND SS.SYS_TIME <  TO_DATE(''' || v_char_endTime   || ''', ''yyyy-MM-dd hh24:mi:ss'')
                           --������ͨ��(�����)
                           AND (((SS.IS_ORIGINAL_SMS = 0 and C.LINK_MODE != all(''CMPP2'',''SGIP'',''SMGP3''))
                           --ֱ��ͨ��(��Ҫ���)
                            OR (SS.MOBILE_QUANTITIES=1 AND C.LINK_MODE = any(''CMPP2'',''SGIP'',''SMGP3'') and SS.SEND_STATUS =any(1,5,6)))
                            OR SS.SEND_STATUS=any(7,8))
                 ) T
           WHERE 1=1
           AND T.SEND_STATUS =any(1,5,6,7,8)
           GROUP BY T.PARENT_ORG_ID, T.ORG_ID, T.OPERATOR_ID, T.USER_ID,T.SEND_STATUS,T.SYSDAT,T.GRANTER_ID';

           --ί����

               v_SQL := 'select u.user_name,ssa.status,sum(ssa.quantity) from ' || '(' || v_subSQL || ') ssa
                     left join user_info u on ssa.user_id = u.user_id
                   where 1=1' ;
                  --��ǰ��¼�û�
                 if p_operatorID is not null then
                    v_SQL := v_SQL || ' and ssa.operator_id = ''' || p_operatorID || '''';
                 end if;
                 if p_status is not null then
                    v_SQL := v_SQL || ' and ssa.status in (' || p_status || ')';
                 end if;
                 if  p_userID is not null then
                      v_SQL := v_SQL || 'and ssa.granter_id in ('|| p_userID || ')';
                 end if;
                 v_SQL := v_SQL || ' group by u.user_name,ssa.status';

      end if;

     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;

end QUERY_PRICIPAL_SMS_SEND;
/

prompt
prompt Creating procedure QUERY_RECKONING_INFO_REPORT
prompt ==============================================
prompt
create or replace procedure mc.QUERY_RECKONING_INFO_REPORT
                (
                 p_startTime in varchar2,          --��ʼʱ�䣨������)
                 p_endTime in varchar2,            --����ʱ�� ��������)
                 p_statType in number,             --��ѯ���� 0 һ�������ѯ��1 ����������ѯ 2 ��������Ա��ѯ
                 p_orgID in varchar2,              --����ID �������
                 p_userID in varchar2,             --�û�ID Admin ������
                 p_userOrgId in varchar2,          --�û�����
                 p_pageSize number,                --ÿһҳ�ж���������
                 p_page number,                    --��ǰ�ǵڼ�ҳ
                 p_count out number,               --������
                 mycursor out sys_refcursor        --���ؽ�����α�
                 )
 is
       v_startTime number(8);                      --�濪ʼ����
       v_endTime number(8);                        --���������
       v_debug number(1);                          --�Ƿ�������Ϣ, 0:���� ��1����
       v_SQL varchar2(8000);                       -- ƴ�ӵĻ���SQL
begin
       v_SQL := '';
       v_debug := 0;
       --------ͳ�Ʋ�ѯ����������
        if p_statType = 1  then   --��������ͳ��
            if p_startTime is null and p_endTime is null then
               if p_userID is not null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d
                  where d.user_id=p_userID
                 group by d.user_id,d.reckoning_date) a;
               end if;
                if p_orgID is not null then
                    select count(a.user_id) into p_count from
                    (select d.user_id,d.reckoning_date from daily_reckoning_info d
                     left join user_info u on d.user_id=u.user_id
                     left join organization o on o.user_id=u.organization_id
                     where o.user_id=p_orgID
                     group by d.user_id,d.reckoning_date) a;
               end if;

               if p_userID is null and p_orgID is null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d
                 left join user_info u on d.user_id=u.user_id
                 left join organization o on o.user_id=u.organization_id
                 where o.user_id=p_userOrgId
                 group by d.user_id,d.reckoning_date) a;
               end if;
            else
                if p_userID is not null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d
                  where d.user_id=p_userID
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
                 group by d.user_id,d.reckoning_date) a;
               end if;

                if p_orgID is not null then
                    select count(a.user_id) into p_count from
                    (select d.user_id,d.reckoning_date from daily_reckoning_info d
                     left join user_info u on d.user_id=u.user_id
                     left join organization o on o.user_id=u.organization_id
                     where o.user_id=p_orgID
                     and to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
                     and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
                     group by d.user_id,d.reckoning_date) a;
               end if;

               if p_userID is null and p_orgID is null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d
                 left join user_info u on d.user_id=u.user_id
                 left join organization o on o.user_id=u.organization_id
                 where o.user_id=p_userOrgId
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
                 group by d.user_id,d.reckoning_date) a;
               end if;
            end if;


        end if;

        if p_statType = 2  then   --��������Ա����ͳ��
           if p_startTime is null and p_endTime is null then
              if p_userID is not null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d where d.user_id=p_userID
                 group by d.user_id,d.reckoning_date) a;
             end if;
             if p_orgID is not null then
                   select count(a.user_id) into p_count from
                   (select d.user_id,d.reckoning_date from daily_reckoning_info d
                   left join user_info u on d.user_id=u.user_id
                   left join organization o on o.user_id=u.organization_id
                   where o.user_id=p_orgID
                   group by d.user_id,d.reckoning_date) a;
             end if;
             if p_userID is null and p_orgID is null then
               select count(a.user_id) into p_count from
               (select d.user_id,d.reckoning_date from daily_reckoning_info d
               group by d.user_id,d.reckoning_date) a;
             end if;
           else
              if p_userID is not null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d where d.user_id=p_userID
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
                 group by d.user_id,d.reckoning_date) a;
             end if;
             if p_orgID is not null then
                   select count(a.user_id) into p_count from
                   (select d.user_id,d.reckoning_date from daily_reckoning_info d
                   left join user_info u on d.user_id=u.user_id
                   left join organization o on o.user_id=u.organization_id
                   where o.user_id=p_orgID
                   and to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
                   and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
                   group by d.user_id,d.reckoning_date) a;
             end if;
             if p_userID is null and p_orgID is null then
               select count(a.user_id) into p_count from
               (select d.user_id,d.reckoning_date from daily_reckoning_info d
               where to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
               and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
               group by d.user_id,d.reckoning_date) a;
             end if;
           end if;

        end if;


        --�����ѯ��ʼ����
       if p_startTime is not null  then
             v_startTime := to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'));
       end if;
       if p_endTime is not null then
             v_endTime := to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'));
       end if;

       if v_debug = 1 then
         DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime);
         DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime);
       end if;

       if p_statType = 1  then   --��������ͳ��
          v_SQL := 'select t2.user_id,t2.user_name,t2.reckoning_date,t2.SEND_QUANTITY,t2.SUB_TOTAL_FEE from (';
          v_SQL := v_SQL|| ' select rownum r,t1.* from (';
          v_SQL := v_SQL|| ' select dri.user_id,dri.user_name,dri.reckoning_date,SUM(dri.SEND_QUANTITY) SEND_QUANTITY,SUM(dri.SUB_TOTAL_FEE) SUB_TOTAL_FEE
                    from daily_reckoning_info dri
                    left join user_info u on dri.user_id=u.user_id
                    left join organization o on u.organization_id=o.user_id
                    where u.organization_id='''||p_userOrgId||'''';

           if p_userID is not null then
               v_SQL := v_SQL || ' and dri.user_id='''|| p_userID || '''';
           end if;

           if v_startTime is not null then
               v_SQL := v_SQL || ' and to_number(to_char(dri.reckoning_date,''yyyymmdd'')) >= ' || v_startTime ;
           end if;

           if v_endTime is not null then
               v_SQL := v_SQL || ' and to_number(to_char(dri.reckoning_date,''yyyymmdd'')) <= ' || v_endTime ;
           end if ;

           v_SQL := v_SQL || ' GROUP BY dri.USER_ID,dri.USER_NAME,dri.RECKONING_DATE order by dri.reckoning_date desc,dri.user_id desc';
           v_SQL := v_SQL || ') t1 where rownum<='||p_page||'*'||p_pageSize;
           v_SQL := v_SQL || ') t2 where t2.r > '||'('||p_page||'-1)*'||p_pageSize||'';
      end if;


         if p_statType = 2  then --��������Ա����ͳ��
          v_SQL := 'select t2.user_id,t2.user_name,t2.reckoning_date,t2.SEND_QUANTITY,t2.SUB_TOTAL_FEE from ( ';
          v_SQL := v_SQL|| ' select rownum r,t1.* from ( ';
          v_SQL := v_SQL|| 'select dri.user_id,dri.user_name,dri.reckoning_date,SUM(dri.SEND_QUANTITY) SEND_QUANTITY,SUM(dri.SUB_TOTAL_FEE) SUB_TOTAL_FEE
                    from daily_reckoning_info dri
                    left join user_info u on dri.user_id=u.user_id
                    left join organization o on u.organization_id=o.user_id
                    where 1=1 ';
            if p_userID is not null then
                  v_SQL := v_SQL || ' and dri.user_id='''|| p_userID || '''';
           end if;

           if p_orgID is not null then
                 v_SQL := v_SQL || ' and u.organization_id='''|| p_orgID || '''';
           end if;

           if v_startTime is not null then
                  v_SQL := v_SQL || ' and to_number(to_char(dri.reckoning_date,''yyyymmdd'')) >= '|| v_startTime ;
           end if;

           if v_endTime is not null then
                  v_SQL := v_SQL || ' and to_number(to_char(dri.reckoning_date,''yyyymmdd'')) <= ' || v_endTime ;
           end if ;

           v_SQL := v_SQL || ' GROUP BY dri.USER_ID,dri.USER_NAME,dri.RECKONING_DATE order by dri.reckoning_date desc,dri.user_id';
           v_SQL := v_SQL||') t1 where rownum<='||p_page||'*'||p_pageSize;
           v_SQL := v_SQL||') t2 where t2.r > '||'('||p_page||'-1)*'||p_pageSize||'';
      end if;

      --dbms_output.put_line('v_SQL = ' || v_SQL);
/*      insert into temp_table_test (CREATE_SQL, CREATE_TIME)
      values (v_SQL, sysdate);*/

      open mycursor for v_SQL ;

  exception
  when others then
  dbms_output.put_line('error:'||sqlcode||':'||sqlerrm);
end QUERY_RECKONING_INFO_REPORT;
/

prompt
prompt Creating procedure QUERY_SMS_CHANNEL
prompt ====================================
prompt
create or replace procedure mc.QUERY_SMS_CHANNEL(
                  p_startTime in varchar2,--��ʼʱ�䣨������) 2012-12-13
                  p_endTime in varchar2,--����ʱ�� ��������) 2012-12-13
                  p_statType in number, -- ͳ������ 0   ��������Աͨ��ͳ�ƣ�1  ��ͨ����Աͨ��ͳ��
                  p_channelID in varchar2,--ͨ��ID   1,2,3,....n ������ʽ
                  p_orgID in varchar2,--����ID �������
                  p_status in varchar2,--״̬
                  mycursor out sys_refcursor--���ؽ�����α�
                 )
is
       v_startTime number(8);--�濪ʼ����
       v_endTime number(8);--���������
       v_char_startTime number(8);--�濪ʼ����
       v_char_endTime number(8);--���������

       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����

       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
       v_subSQL varchar2(8000);
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --�����ѯ��ʼ����
     if p_startTime is not null  then
             v_startTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
             v_char_startTime := to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD');

     end if;
     if p_endTime is not null then
             v_endTime :=to_number( to_char(to_date(p_endTime,'yyyy-MM-dd hh24:mi:ss') + 1,'YYYYMMDD'));
             v_char_endTime   := to_char(to_date(p_endTime,  'yyyy-MM-dd hh24:mi:ss') + 1,'YYYYMMDD');
     end if;

     if v_startTime != 0 and v_endTime != 0 and v_startTime > v_endTime then
        v_startTime := v_endTime;
        v_endTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
        v_char_endTime   := to_char(to_date(p_startTime,  'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD');
     end if;

       /*
        SELECT T.CHANNEL_ID,
               T.PARENT_ORG_ID,
               T.ORG_ID,
               SEND_STATUS,
               T.SYSDAT,
               SUM(MOBILE_QUANTITIES) AS total_quantity
          FROM
          (
               SELECT TO_NUMBER(TO_CHAR(SS.SYS_TIME, 'YYYYMMDD')) AS SYSDAT,
                       SS.CHANNEL_ID,
                       O.PARENTID AS PARENT_ORG_ID,
                       SS.USER_ORGANIZATION AS ORG_ID,
                       SS.SEND_STATUS,
                       SS.MOBILE_QUANTITIES
                  FROM SEND SS
                  LEFT JOIN ORGANIZATION O
                    ON SS.USER_ORGANIZATION = O.USER_ID
                 WHERE 1 = 1
                   AND SS.SEND_STATUS IN (0, 1, 5, 6, 7)
                   AND SS.SYS_TIME >= TO_DATE('2013-06-17', 'YYYY-MM-DD')
                   AND SS.SYS_TIME <  TO_DATE('2013-06-18', 'YYYY-MM-DD')
         ) T
        GROUP BY T.CHANNEL_ID, T.PARENT_ORG_ID, T.ORG_ID, T.SYSDAT, T.SEND_STATUS
        */
     v_subSQL := '
         SELECT T.CHANNEL_ID,
               T.PARENT_ORG_ID,
               T.ORG_ID,
               t.SEND_STATUS as STATUS,
               SUM(MOBILE_QUANTITIES) AS QUANTITY
          FROM
          (
               SELECT  SYS_TIME AS SYSDAT,
                       SS.CHANNEL_ID,
                       O.PARENTID AS PARENT_ORG_ID,
                       SS.USER_ORGANIZATION AS ORG_ID,
                       SS.SEND_STATUS,
                       SS.MOBILE_QUANTITIES
                  FROM SEND SS
                  LEFT JOIN ORGANIZATION O ON SS.USER_ORGANIZATION = O.USER_ID
                  LEFT JOIN CHANNEL_INFO C ON SS.CHANNEL_ID = C.CHANNEL_ID
                 WHERE 1 = 1
                   AND SS.SYS_TIME >= TO_DATE(''' || v_char_startTime || ''', ''yyyy-MM-dd hh24:mi:ss'')
                   AND SS.SYS_TIME <  TO_DATE(''' || v_char_endTime   || ''', ''yyyy-MM-dd hh24:mi:ss'')
                   --������ͨ��(�����)
                   AND ((SS.IS_ORIGINAL_SMS = 0 and C.LINK_MODE != all(''CMPP2'',''SGIP'',''SMGP3''))
                   --ֱ��ͨ��(��Ҫ���)
                    OR (SS.MOBILE_QUANTITIES=1 AND C.LINK_MODE = any(''CMPP2'',''SGIP'',''SMGP3'') and SS.SEND_STATUS =any(1,5,6)))
         ) T
         WHERE 1=1
         AND  T.SEND_STATUS =ANY(1,5,6)
        GROUP BY T.CHANNEL_ID, T.PARENT_ORG_ID, T.ORG_ID, T.SEND_STATUS
        ';

     if v_debug = 1 then
       DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime );
       DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime );
     end if;
     if p_statType = 0 then --��������ͨ��ͳ��

          v_SQL := 'select c.channel_name,o.user_name,sca.status,sum(sca.quantity) from ' || '(' || v_subSQL || ') sca
                   left join channel_info c on sca.channel_id = c.channel_id
                          left join organization o on sca.org_id = o.user_id
                   where 1 = 1 ' ;
          /*
           v_SQL := 'select c.channel_name,o.user_name,sca.status,sum(sca.quantity) from sms_channel_analyze sca
                     left join channel_info c on sca.channel_id = c.channel_id
                          left join organization o on sca.parent_org_id = o.user_id
                   where 1 = 1 ' ;
           */

           if p_channelID is not null then
               v_SQL := v_SQL || ' and sca.channel_id = ' || p_channelID ;
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and sca.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by c.channel_name,o.user_name,sca.status';
      else

          v_SQL := 'select c.channel_name,o.user_name,sca.status,sum(sca.quantity) from ' || '(' || v_subSQL || ') sca
                   left join channel_info c on sca.channel_id = c.channel_id
                   left join organization o on sca.ORG_ID = o.user_id
                   where 1 = 1
                         and sca.org_id = ''' || p_orgID || '''' ;
          /*
              v_SQL := 'select c.channel_name,o.user_name,sca.status,sum(sca.quantity) from sms_channel_analyze sca
                       left join channel_info c on sca.channel_id = c.channel_id
                            left join organization o on sca.org_id = o.user_id
                     where  sca.parent_org_id = ''' || p_orgID || '''' ;
            */

           if p_channelID is not null then
               v_SQL := v_SQL || ' and sca.channel_id = ' || p_channelID ;
           end if;


           if p_status is not null then
              v_SQL := v_SQL || ' and sca.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by c.channel_name,o.user_name,sca.status';
      end if;

/*      insert into temp_table_test (CREATE_SQL, CREATE_TIME)
      values (v_SQL,sysdate);*/
     --ƴִ��SQL��ʼ

/*      DBMS_OUTPUT.PUT_LINE('v_SQL = ' || v_SQL);
*/
     open mycursor for v_SQL ;

end QUERY_SMS_CHANNEL;
/

prompt
prompt Creating procedure QUERY_SMS_RECEIVE
prompt ====================================
prompt
create or replace procedure mc.QUERY_SMS_RECEIVE(p_startTime    in varchar2, --��ʼʱ�䣨������)
                                              p_endTime      in varchar2, --����ʱ�� ��������)
                                              p_statType     in number, -- ͳ������ 0 ��Ի���ͳ�����ж��ţ�1 ����û�ͳ�����ж���
                                              p_userID       in varchar2, --����ID Admin ������
                                              p_parentOrgID  in varchar2, --����ID ������
                                              p_orgID        in varchar2, --����ID �������
                                              p_pageNo       in number, --��ǰҳ�棬��1��ʼ
                                              p_pageSize     in number, --ÿҳ��¼��
                                              outRecordCount out number, --���ؼ�¼������
                                              mycursor       out sys_refcursor --���ؽ�����α�
                                              ) is

  v_SQL            varchar2(8000); -- ƴ�ӵĻ���SQL
  v_SQL_TotalCount varchar2(8000); -- ��ѯ��¼������SQL
  v_SQL_Result     varchar2(8000); -- ��ѯ�����SQL

  v_hiRownum number(8); --��ǰҳ��¼��Ӧ����ҳ��
  v_loRownum number(8); --��ǰҳ��¼��Ӧ��С��ҳ��
begin
  v_SQL      := '';
  v_hiRownum := 15;
  v_loRownum := 0;

  --ƴִ��SQL��ʼ
  if p_statType = 0 then
    --��Ի���ͳ�����ж���
    if p_parentOrgID is not null then
      --ͳ�����л����ӻ���
      v_SQL := 'select o.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.org_id ,count(r.receive_id) as receive_count from sms_receive r where r.sys_time >= to_date(''' ||
               p_startTime||''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <=to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.org_id) t left join organization o on t.org_id = o.user_id where o.parentid= ''' ||
               p_parentOrgID || ''' or o.user_id = ''' || p_parentOrgID ||
               ''' group by o.user_name';
    else
      --ֻͳ��ĳ������
      v_SQL := 'select o.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.org_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.org_id) t left join organization o on t.org_id = o.user_id  group by o.user_name';
    end if;
  else
    --����û�ͳ�����ж���
    if p_userID is not null then
      --ͳ�Ƹû���ĳ���û�
      v_SQL := 'select u.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.user_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and r.user_id =''' || p_userID ||
               ''' and r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.user_id) t left join user_info u on t.user_id = u.user_id group by u.user_name';
    else
      -- ͳ�Ƹû��������û�
      v_SQL := 'select u.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.user_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and  r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.user_id) t left join user_info u on t.user_id = u.user_id group by u.user_name';
    end if;
  end if;

  dbms_output.put_line('v_SQL = ' || v_SQL);
  --��ѯ��ǰ�����¼�¼������
  v_SQL_TotalCount := ' SELECT count(*) FROM ( ';
  v_SQL_TotalCount := v_SQL_TotalCount || v_SQL;
  v_SQL_TotalCount := v_SQL_TotalCount || ' ) ';
  --ȡ��¼������
  execute immediate v_SQL_TotalCount
    into outRecordCount;
  --�����ҳ��ҳ��
  v_hiRownum := p_pageNo * p_pageSize;
  v_loRownum := v_hiRownum - p_pageSize + 1;
  --ƴ��ҳ�Ĳ�ѯSQL
  v_SQL_Result := ' select * FROM (  select A.*, rownum rn From ( ';
  v_SQL_Result := v_SQL_Result || v_SQL;
  v_SQL_Result := v_SQL_Result || ' ) A   where rownum <= ' ||
                  to_char(v_hiRownum) || ' ) B  where rn >= ' ||
                  to_char(v_loRownum);
  open mycursor for v_SQL_Result;

end QUERY_SMS_RECEIVE;
/

prompt
prompt Creating procedure QUERY_SMS_SEND
prompt =================================
prompt
create or replace procedure mc.QUERY_SMS_SEND(
                  p_startTime in varchar2,--��ʼʱ�䣨������)
                  p_endTime in varchar2,--����ʱ�� ��������)
                  p_statType in number, -- ͳ������ 2 һ�����ͳ�ƣ�1 ������������ͳ�� 0 ��������Ա����ͳ��
                  p_userID in varchar2,--�û�ID Admin ������
                  p_parentOrgID in varchar2,--����ID ������

                  p_orgID in varchar2,--����ID �������
                  p_status in varchar2,-- ״̬
                  mycursor out sys_refcursor--���ؽ�����α�
                 )
is
       v_startTime number(8);--�濪ʼ����
       v_endTime number(8);--���������
       v_char_startTime number(8);--�濪ʼ����
       v_char_endTime number(8);--���������

       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
       v_subSQL varchar2(8000);
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --�����ѯ��ʼ����
    if p_startTime is not null  then
             v_startTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
             v_char_startTime := to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD');
     end if;
     if p_endTime is not null then
             v_endTime :=to_number( to_char(to_date(p_endTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
             v_char_endTime   := to_char(to_date(p_endTime,  'yyyy-MM-dd hh24:mi:ss') + 1,'YYYYMMDD');
     end if;

     if v_startTime != 0 and v_endTime != 0 and v_startTime > v_endTime then
        v_startTime := v_endTime;
        v_endTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
        v_char_endTime   := to_char(to_date(p_endTime,  'yyyy-MM-dd hh24:mi:ss') + 1,'YYYYMMDD');
     end if;

     if v_debug = 1 then
       DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime );
       DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime );
     end if;

      v_subSQL := '
          SELECT T.PARENT_ORG_ID,
                 T.DEDUCT_MODE,
                 T.ORG_ID,
                 T.USER_ID,
                 T.SEND_STATUS AS STATUS,
                 T.SYSDAT,
                 SUM(MOBILE_QUANTITIES) AS QUANTITY
            FROM (
                   --��ͨ����ѯ
                   SELECT  SYS_TIME AS SYSDAT,
                           O.PARENTID AS PARENT_ORG_ID,
                           O.DEDUCT_MODE,
                           SS.USER_ORGANIZATION AS ORG_ID,
                           SS.USER_ID,
                           SS.SEND_STATUS,
                           SS.MOBILE_QUANTITIES
                      FROM SEND SS
                      LEFT JOIN TASK_INFO TI ON TI.BATCH_ID=SS.BATCH_ID
                      LEFT JOIN ORGANIZATION O ON SS.USER_ORGANIZATION = O.USER_ID
                      LEFT JOIN CHANNEL_INFO C ON SS.CHANNEL_ID = C.CHANNEL_ID
                     WHERE 1=1
                           AND TI.GRANTER_ID IS NULL
                           AND SS.SYS_TIME >= TO_DATE(''' || v_char_startTime || ''', ''yyyy-MM-dd hh24:mi:ss'')
                           AND SS.SYS_TIME <  TO_DATE(''' || v_char_endTime   || ''', ''yyyy-MM-dd hh24:mi:ss'')
                          --������ͨ��(�����)
                           AND (((SS.IS_ORIGINAL_SMS = 0 and C.LINK_MODE != all(''CMPP2'',''SGIP'',''SMGP3''))
                           --ֱ��ͨ��(��Ҫ���)
                            OR (SS.MOBILE_QUANTITIES=1 AND C.LINK_MODE = any(''CMPP2'',''SGIP'',''SMGP3'') and SS.SEND_STATUS =any(1,5,6)))
                            OR SS.SEND_STATUS=any(7,8))
                 ) T
           WHERE 1=1
           AND T.SEND_STATUS =any(1,5,6,7,8)
           GROUP BY T.PARENT_ORG_ID,T.DEDUCT_MODE,T.ORG_ID, T.USER_ID, T.SYSDAT, T.SEND_STATUS';
     --ƴִ��SQL��ʼ
     if p_statType = 2  then --һ�����ͳ��
          v_SQL := 'select u.user_name,ssa.status,sum(ssa.quantity),ssa.deduct_mode from ' || '(' || v_subSQL || ') ssa
                     left join user_info u on ssa.user_id = u.user_id
                   where ssa.org_id  = ''' || p_orgID || '''' ;
           if p_userID is not null then
              v_SQL := v_SQL || ' and ssa.user_id = ''' || p_userID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and ssa.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by u.user_name,ssa.status,ssa.deduct_mode';
      end if;

      if p_statType = 1  then --��������ͳ��
          v_SQL := 'select o.user_name,ssa.status,sum(ssa.quantity),ssa.deduct_mode from ' || '(' || v_subSQL || ') ssa
                          left join organization o on ssa.org_id = o.user_id
                   where 1=1 ' ;
                   --ssa.parent_org_id  = ''' || p_parentOrgID || '''

           if p_orgID is not null then
               v_SQL := v_SQL || ' and ssa.org_id = ''' || p_orgID || '''';
           end if;

           if p_parentOrgID is not null then
               v_SQL := v_SQL || ' and (ssa.parent_org_id = ''' || p_parentOrgID || ''' or ssa.org_id='''||p_parentOrgID||''')';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and ssa.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by o.user_name,ssa.status,ssa.deduct_mode';
      end if;

      if p_statType = 0  then --��������Ա����ͳ��
          v_SQL := 'select o.user_name,ssa.status,sum(ssa.quantity),ssa.deduct_mode from ' || '(' || v_subSQL || ') ssa
                          left join organization o on ssa.org_id = o.user_id
                   where 1= 1 ' ;
           if p_orgID is not null then
              v_SQL := v_SQL || ' and ssa.org_id = ''' || p_orgID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and ssa.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by o.user_name,ssa.status,ssa.deduct_mode';
      end if;

        --������ʱ��
    --  insert into temp_table_test (CREATE_SQL, CREATE_TIME)values (v_SQL,sysdate);
    /* dbms_output.put_line('v_SQL = ' || v_SQL);*/
     open mycursor for v_SQL ;

     exception
       when others then
     rollback;
end QUERY_SMS_SEND;
/

prompt
prompt Creating procedure UPDATE_SPLITED_LONGSMS
prompt =========================================
prompt
create or replace procedure mc.UPDATE_SPLITED_LONGSMS is
 ----��ͨ�����ų�����
  CURSOR send_longcur IS
  SELECT *
         from send t
         where
              t.send_status = -2
              and rownum <= 5000
              and t.is_original_sms = 1
              and t.current_pageno = t.originalsms_totalpages;
  ----��ͨ�����ŵ���ͨ����
  /* CURSOR send_shortcur IS
    SELECT *
         from send t
         where
              t.send_status = -2
              and rownum <= 5000
              and t.is_original_sms = 0
              and t.originalsms_totalpages=1;*/

  r_send            send%rowtype;
 -- s_send            send%rowtype;
  v_msg_total             varchar2(2000);--ƴ�ӵ���Ϣ
  v_msg_count       number :=0;
  v_signature_ok    number :=0;
  v_has_total       number :=1; --�Ƿ������Ķ���
  v_send_id         varchar2(2000);
  errormessage      exception;
  begin
     open send_longcur;
      --������
      loop
          fetch send_longcur into r_send;
          exit when send_longcur%notfound;
          v_msg_total    := '';
          v_msg_count    := 0;
          v_signature_ok := 0;
          v_has_total    := 1;
          v_send_id      := '';

          --��ѯ�������
          --ѭ����ƴ�Ӷ���
          FOR a_send IN (
                         select *
                                from send t
                                where     t.send_status = -2
                                      and t.mobile_to = r_send.mobile_to
                                      and t.longsms_tag = r_send.longsms_tag
                                 order by t.current_pageno )
          LOOP
              v_msg_count := v_msg_count + 1;

              --������������
              if v_msg_count != to_number(a_send.current_pageno) THEN
                 --��Ų�һ�£����Ƴ�ѭ����trigger
                 v_has_total := 0;
                 exit;
              end if;
              --ƴ�ӳ�����
              v_msg_total := v_msg_total||a_send.send_msg;
              if length(v_send_id) > 0 then
                   v_send_id := v_send_id||','||''''||a_send.send_id||'''';
              else
                   v_send_id := ''''||a_send.send_id||'''';
              end if;
          END LOOP;

          --����ƴ�ӳɳ�����
          if v_has_total = 1 and v_msg_count = r_send.originalsms_totalpages then
            --��ȡ���5���ֽڿ��Ƿ�������ظ�TD�˶��ؼ��֡�
            if instr(substr(v_msg_total,length(v_msg_total)-5),'�ظ�TD�˶�')>0
              then
               --���³����ŵ�״̬Ϊ-1
               execute immediate ('update send set send_status = -1 where send_id in (' || v_send_id || ')');
               dbms_output.put_line('���µĶ��ż�¼Ϊ---��'||'update send set send_status = -1 where send_id in (' || v_send_id || ')');
              commit;
            else
              --�����Ų��������ظ�TD�˶�������״̬Ϊ6
              dbms_output .put_line('�����ظ�TD�˶��ĳ�����---:'||'update send set send_status = 6, report = ''UD:0001'',err_msg = ''�����ظ�TD�˶�'' , report_time = sysdate where send_id in (' || v_send_id || ')');
               execute immediate ('update send set send_status = 6, report = ''UD:0001'',err_msg = ''�����ظ�TD�˶�'' , report_time = sysdate where send_id in (' || v_send_id || ')');
               dbms_output .put_line('�����ظ�TD�˶��ĳ�����---:'||'update send set send_status = 6, report = ''UD:0001'',err_msg = ''�����ظ�TD�˶�'' , report_time = sysdate where send_id in (' || v_send_id || ')');
               commit;
            end if;
           end if;
           -- exit when send_longcur%notfound;
        end loop;
      close send_longcur;
     /* open send_shortcur;
        loop 
          fetch send_shortcur into s_send;
           exit when send_shortcur%notfound;
            if  instr(substr(s_send.send_msg,length(s_send.send_msg)-5),'�ظ�TD�˶�')>0
              then
              --���¶���״̬Ϊ-1
              update send set send_status = -1 where send_id = s_send.send_id;
              dbms_output.put_line('���µĶ��ż�¼Ϊ---��'||'update send set send_status = -1 where send_id ='||s_send.send_id);
              commit;
             else
               update send set send_status = 6 ,report = 'UD:0001',err_msg='�����ظ�TD�˶�',report_time=sysdate where send_id = s_send.send_id;
               dbms_output .put_line('�����ظ�TD�˶��ĳ�����---:'||'update send set send_status = 6, report = ''UD:0001'',err_msg = ''�����ظ�TD�˶�'' , report_time = sysdate where send_id ='||s_send.send_id);
               commit;
             end if;
           
        end loop;
      close send_shortcur;*/
          
  --���³�ʱ�Ķ���,60����֮ǰ��
  update send t set t.send_status = 6, t.err_msg = '������ͨ���Ŷ��ų�ʱ' where t.send_status = -2 and t.sys_time < (sysdate - 60/60/24);
  commit;
  
end UPDATE_SPLITED_LONGSMS;
/

prompt
prompt Creating procedure UPDATE_USER_STATE
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE mc.UPDATE_USER_STATE IS
BEGIN

    --�����û�״̬Ϊ��Ч
    UPDATE USER_INFO U SET U.USER_STAT=1,U.LOGIN_ERROR_NUM=0 WHERE U.LOGIN_ERROR_NUM >0;
    COMMIT;
    EXCEPTION
       WHEN OTHERS THEN
    ROLLBACK;
END UPDATE_USER_STATE;
/

prompt
prompt Creating trigger TRIGGER_AFTERDELETE_REPORTTASK
prompt ===============================================
prompt
CREATE OR REPLACE TRIGGER mc.trigger_afterdelete_reporttask

AFTER delete ON sgw_report_task
For each row
DECLARE
--ɾ��״̬�������д״̬��������ʱ��
BEGIN
    update send s set s.send_time = systimestamp where SEND_ID = :old.SEND_ID;

    BEGIN
      --����֤ȯ��״̬����
      --IF :old.User_Organization = 'fcaaf96b2b8ed794012b99e92baa0568' THEN
          INSERT INTO sgw_report_task_his
          (
            task_id,
            send_id,
            mobile_to,
            destnation_id,
            stat,
            msg_id,
            user_organization,
            user_id,
            channel_id,
            sys_time,
            submit_time,
            done_time,
            report_time,
            push_status,
            next_push_time,
            push_times,
            log_time
          )
          values
          (
            :old.task_id,
            :old.Send_Id,
            :old.Mobile_To,
            :old.Destnation_Id,
            :old.Stat,
            :old.Msg_Id,
            :old.User_Organization,
            :old.User_Id,
            :old.Channel_Id,
            :old.Sys_Time,
            :old.Submit_Time,
            :old.Done_Time,
            :old.Report_Time,
            5,
            :old.Next_Push_Time,
            :old.Push_Times,
            SYSDATE
          );
      --END IF;
      EXCEPTION
          WHEN OTHERS THEN
             NULL;
      END;
END;
/

prompt
prompt Creating trigger TRIGGER_AFTERDELETE_RT_RECEIVE
prompt ===============================================
prompt
CREATE OR REPLACE TRIGGER mc.trigger_afterdelete_rt_receive
AFTER delete ON rt_receive
For each row

DECLARE

BEGIN
  --ɾ��״̬����󣬽�״̬�������͵���Ϣ�鵵�������ӹ鵵ʱ���ֶ�
    BEGIN
          INSERT INTO rt_receive_backup
          (
            RT_RECEIVE_ID,
            ORG_ID,
            USER_ID,
            SP_NO,
            SP_SERV_NO,
            MOBILE,
            RECEIVE_MSG,
            RECEIVE_TIME,
            PUSHED_TIME,
            IS_PUSHED,
            RESERVED_CHAR1,
            RESERVED_CHAR2,
            BACKUP_TIME
          )
          values
          (
            :old.RT_RECEIVE_ID,
            :old.ORG_ID,
            :old.USER_ID,
            :old.SP_NO,
            :old.SP_SERV_NO,
            :old.MOBILE,
            :old.RECEIVE_MSG,
            :old.RECEIVE_TIME,
            :old.PUSHED_TIME,
            :old.IS_PUSHED,
            :old.RESERVED_CHAR1,
            :old.RESERVED_CHAR2,
            SYSDATE
          );
      EXCEPTION
          WHEN OTHERS THEN
             NULL;
      END;
END;
/

prompt
prompt Creating trigger TRIGGER_AFTERDELETE_RT_REPORT
prompt ==============================================
prompt
CREATE OR REPLACE TRIGGER mc.trigger_afterdelete_rt_report
AFTER delete ON rt_report
For each row

DECLARE
--ɾ��״̬��������������Ϣ�󣬽�״̬���͵���Ϣ�鵵�������ӹ鵵ʱ���ֶ�
BEGIN

    BEGIN
          INSERT INTO rt_report_backup
          (
            SMS_ID,
            SEQ_ID,
            ORG_ID,
            USER_ID,
            MOBILE,
            REPORT_TIME,
            PUSHED_TIME,
            SEND_STATUS,
            ERROR_MSG,
            IS_PUSHED,
            CHANNEL_ID,
            BACKUP_TIME
          )
          values
          (
            :old.SMS_ID,
            :old.SEQ_ID,
            :old.ORG_ID,
            :old.USER_ID,
            :old.MOBILE,
            :old.REPORT_TIME,
            :old.PUSHED_TIME,
            :old.SEND_STATUS,
            :old.ERROR_MSG,
            :old.IS_PUSHED,
            :old.CHANNEL_ID,
            SYSDATE
          );
      EXCEPTION
          WHEN OTHERS THEN
             NULL;
      END;
END;
/

prompt
prompt Creating trigger TRIGGER_AFTERINSERT_RECEIVE
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER mc.trigger_afterinsert_receive --�����������, ��д��Ӧ������
AFTER INSERT ON sms_receive
For each row

DECLARE

--��Ҫ���е��û�
CURSOR cmpp_org_cur IS
       SELECT user_id, user_name, ORGANIZATION_ID as org_id  from user_info where user_kind = 3;


BEGIN

    --����Ƿ�����ҵ���Ӧ���û�
    FOR s IN cmpp_org_cur LOOP
    if :NEW.user_id = s.user_id then
      --INSERT INTO sql_log VALUES(s.user_name, SYSDATE, 'trigger_afterinsert_receive userid');
      insert into SGW_MO_TASK (receive_id, mobile_from, sp_no, receive_msg, read_user_group_id, user_id, channel_id, receive_time, receive_status, next_push_time)
      values(sgw_mo_task_seq.nextval, :new.mobile_from, :new.sp_num, :new.receive_msg, :new.org_id, :new.user_id, :new.channel_id, :new.sys_time, 0, sysdate);
      exit;
        end if;
    END LOOP;

    --���û���ҵ���Ӧ���û���������Ӧ�Ļ���
    FOR s IN cmpp_org_cur LOOP
    if :NEW.org_id = s.org_id THEN
      --INSERT INTO sql_log VALUES(s.org_id, SYSDATE, 'trigger_afterinsert_receive orgid');
      insert into SGW_MO_TASK (receive_id, mobile_from, sp_no, receive_msg, read_user_group_id, user_id, channel_id, receive_time, receive_status, next_push_time)
      values(sgw_mo_task_seq.nextval, :new.mobile_from, :new.sp_num, :new.receive_msg, :new.org_id, s.user_id, :new.channel_id, :new.sys_time, 0, sysdate);
      exit;
        end if;
    END LOOP;

    exception
       when others then
           --INSERT INTO sql_log VALUES('excepion', SYSDATE, 'trigger_afterinsert_receive exception');
           null;

END;
/

prompt
prompt Creating trigger TRIGGER_AFTER_UPDATE_SEND
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER "MC"."TRIGGER_AFTER_UPDATE_SEND" 
  AFTER UPDATE ON SEND
  FOR EACH ROW
--���²�ֶ��ź󣬸���ԭʼ����
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

  IF :OLD.SEND_STATUS = 1 --ԭʼ״̬��1
     AND (:NEW.SEND_STATUS = 5 OR :NEW.SEND_STATUS = 6) --��״̬��5����6
     AND :OLD.IS_ORIGINAL_SMS = 1 --�ǲ�ֶ���
   THEN
    --����ԭʼ����
    UPDATE SEND T
       SET T.REPORT_TIME = :NEW.REPORT_TIME,
           SEND_STATUS   = CASE
                             WHEN SEND_STATUS = 1 THEN
                              :NEW.SEND_STATUS
                             WHEN SEND_STATUS = 6 AND :NEW.SEND_STATUS = 5 THEN
                              :NEW.SEND_STATUS
                             ELSE
                              SEND_STATUS
                           END,
           REPORT        = CASE
                             WHEN SEND_STATUS = 1 THEN
                              :NEW.REPORT
                             WHEN SEND_STATUS = 6 AND :NEW.SEND_STATUS = 5 THEN
                              :NEW.REPORT
                             ELSE
                              REPORT
                           END
     WHERE T.SEND_ID = :OLD.ORIGINALSMS_SENDID;
    COMMIT;
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    NULL;

END;
/

prompt
prompt Creating trigger TRIGGER_BEFOREINSERT_SEND
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER "MC"."TRIGGER_BEFOREINSERT_SEND" 
  BEFORE insert ON send
  For each row
DECLARE

BEGIN
  --���������롢Υ���ʡ�����ǩ������ǩ����, ����״̬��������
  if :NEW.send_status = 6 and substr(:NEW.Msg_Type,1,4) = 'CMPP'  then
     insert into SGW_REPORT_TASK (task_id, send_id, mobile_to, stat, destnation_id, user_organization, user_id, channel_id, report_time, push_status, next_push_time, push_times,sys_time, submit_time, done_time)
     values(SGW_REPORT_TASK_SEQ.NEXTVAL, :new.send_id, :new.mobile_to, :new.report, '10657101095536' || :new.sp_serv_no, :new.user_organization, :new.user_id, :new.channel_id, sysdate, 0, sysdate, 0,sysdate, sysdate, sysdate);
  end if;
  commit;
  exception
      WHEN OTHERS THEN
           DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
END;
/

prompt
prompt Creating trigger TRIGGER_INSERT_RECEIVE
prompt =======================================
prompt
CREATE OR REPLACE TRIGGER "MC"."TRIGGER_INSERT_RECEIVE"  --�����������, ��д��Ӧ������
BEFORE INSERT ON SMS_RECEIVE_OLD
For each row

DECLARE
--��ѯ������Ϣ
CURSOR send_cur IS
       SELECT t.send_id, t.mobile_to, t.ext_num, t.sys_id, t.msg_id, t.send_status, t.org_id
       FROM sms_send t
       WHERE
            t.mobile_to = :new.mobile_from
            and t.send_status in (1,5)
       ORDER BY t.send_time desc;

--��ѯ�ط���
CURSOR spnumber_cur IS
       SELECT *  from sms_spnumber order by spnumber asc;

--��ѯ�˶��ؼ���
CURSOR key_cur IS
       SELECT KEY_WORD  from SMS_UNSUBSCRIBE_KEY_WORD where status = 1 order by KEY_WORD asc;

--��ѯ�Ƿ��ǵ㲥����
CURSOR recdb_cur IS
       SELECT db_name,db_content  from recbiz_db;

--��ѯ�Ƿ��Ƕ��ŵ���
CURSOR survey_cur IS
       SELECT sms_survey_id,biz_number,thank_word,end_time,start_time,status,sms_directive  from sms_survey ;
survey_temp varchar2(200);
sp varchar2(200);
receive_sys_ext varchar(10);
sys_count number;
receive_sys_id varchar(20); 
BEGIN
  sys_count:=0;
  --����receive_id
  if :new.RECEIVE_ID is null then
    :new.RECEIVE_ID := SMS_RECEIVE_SEQ.nextval;
  end if;
  --������������
    :new.sys_date_id:=to_number(to_char(sysdate,'yyyyMMdd'));

  sp:='';
    --��ѯ��Ӧ�Ķ�����Ϣ, ��дϵͳ���SYS_ID, MSG_ID
    FOR s IN send_cur LOOP 
        :new.sys_id := s.sys_id;       
        :new.msg_id := s.msg_id;                     --ҵ��ϵͳ�Ķ��ű��
        :new.org_id := s.org_id;  --�������
    END LOOP;

    --��ѯ�ط���, ������չ��,������ط��ţ���ôsp���ǳ�ȥ�ط��ŵ����к���
    FOR s IN spnumber_cur LOOP
    if substr(:new.sp_num, 0, length(s.spnumber)) = s.spnumber then
       sp := substr(:new.sp_num, length(s.spnumber) + 1);
      end if;
    END LOOP;
    --���û���ط��ţ���ôsp�������е�ȫ������
    if ''=sp then
      sp:=:new.sp_num;
      end if;
     --receive_sys_ext=��ȡsp����λ��Ϊ��Ϣ��Դ
     receive_sys_ext:=substr(sp,0,2);
     :new.sys_ext:=receive_sys_ext;
     select count(*) into sys_count from subsys_code s_code  where s_code.extend_number=receive_sys_ext;
     --�����Ϣ��Դ��Ϊ�գ���ѯsubsys_code�е�subsys_code_id�����sms_receive���е�sys_id
     if sys_count!=0 then
       select s_code.subsys_code_id into receive_sys_id from subsys_code s_code  where s_code.extend_number=receive_sys_ext;
       :new.sys_id:=receive_sys_id;
     end if;
     --��ȡsp��λ�����Ϊҵ����
     :new.ext_num:=substr(sp,3,length(sp));

    --����������Ƿ����˶��ؼ���,�����Զ��Ӻ�����
    FOR s IN key_cur LOOP
    if INSTR(trim(:new.RECEIVE_MSG), trim(s.KEY_WORD), 1, 1) = 1 then --���˶��ؼ�����ʼ�Ķ���
        insert into black (black_id, black_mobile,black_desc,black_time) values(sys_guid(), :new.mobile_from,'�ÿͻ������˶��ؼ��֣�ϵͳ��'||to_char(sysdate,'yyyy-MM-dd hh24:mi:ss')||'�Զ����ÿͻ����������',sysdate);
      end if;
    END LOOP;

    --��ѯ���ж����������Ƿ�����㲥������
    FOR s IN recdb_cur LOOP
    if NLS_UPPER(trim(:new.RECEIVE_MSG)) = s.db_name then
      :new.msg_key:=1;
      :new.reply_msg:=s.db_content;
     -- P_DIANBO_SEND(:new.mobile_from,s.db_content,sp);--��������ʱ���в���һ������
      end if;
    END LOOP;

     --��ѯ���ж����Ƿ��Ƕ��ŵ���
    FOR s IN survey_cur LOOP
    if :new.ext_num = s.biz_number and :new.sys_time>=s.start_time and :new.sys_time<=s.end_time and s.status!='9' then
      :new.msg_key:=2;
      :new.reply_msg:=s.thank_word;
     -- p_survey_send(:new.mobile_from,:new.receive_msg,:new.receive_id,s.sms_survey_id,sp);
      end if;
    END LOOP;

    --�ж����еĶ����Ƿ��Ǹ��ݶ���ָ����ж��ŵ����
    survey_temp :=substr(:new.receive_msg,0,(instr(:new.receive_msg,'#')-1));
    FOR s IN survey_cur LOOP
      if survey_temp = s.sms_directive and :new.sys_time>=s.start_time and :new.sys_time<=s.end_time and s.status!='9' then
      :new.msg_key:=2;
      :new.reply_msg:=s.thank_word;
     -- p_survey_send(:new.mobile_from,substr(:new.receive_msg,(instr(:new.receive_msg,'#')+1),length(:new.receive_msg)),:new.receive_id,s.sms_survey_id,sp);
      end if;
    END LOOP;

    Exception
      when others then
        null;
END;
/

prompt
prompt Creating trigger TRIGGER_INSERT_SMS_REPORT
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER "MC"."TRIGGER_INSERT_SMS_REPORT"  --�������״̬����, �Զ��޸Ķ��ŵ�״̬�Ͳ�ȫ״̬�����������Ϣ
BEFORE INSERT ON sms_report
For each row
DECLARE
v_err_msg varchar2(30);--������Ϣ
err_code_count number:=0;
CURSOR send_cur IS
       SELECT t.send_id, t.org_id, t.batch_id, t.msg_id, t.originalsms_sendid,t.originalsms_totalpages,t.current_pageno, t.sys_id, t.is_original_sms  from sms_send t where t.sequence = :new.sequence;
BEGIN
    if :new.report_time is null then
        :new.report_time := sysdate;
    end if;

    --��ѯ״̬����Ĵ�����Ϣ,����Ӧ�Ĵ�����Ϣ��д��ERR_MSG
    if :new.sms_status = 6 and :new.gw_status_desc is null then
         err_code_count := 0;
         select count(*) into err_code_count from sms_err_code where channel_id = :new.channel_id and err_code = :new.gw_status and rownum <= 1;
         if err_code_count = 1 then
            select err_desc into v_err_msg from sms_err_code where channel_id = :new.channel_id and err_code = :new.gw_status and rownum <= 1;
         end if;
    end if;
    
    if v_err_msg is not null then
       :new.gw_status_desc :=  v_err_msg;
    end if;

    --������Ӧ�Ķ���
    update sms_send t set t.send_status = :new.sms_status, t.err_id = :new.gw_status, t.err_msg = v_err_msg, t.report_time = :new.report_time where t.sequence = :new.sequence and t.send_status = 1;

    --�����ɹ����¶���״̬
    :new.status := 1;

    --��ѯ��Ӧ�Ķ�����Ϣ
    FOR s IN send_cur LOOP
        :new.send_id := s.send_id;                          --���ű��
        :new.originalsms_sendid := s.originalsms_sendid;      --ԭʼ���ű��
        :new.batch_id := s.batch_id;                        --����
        :new.msg_id := s.msg_id;                            --ҵ��ϵͳ�Ķ��ű��
        :new.originalsms_totalpages := s.originalsms_totalpages;    --����������
        :new.current_pageno := s.current_pageno;                --�������еĵڼ���
        :new.sys_id := s.sys_id;                            --ҵ��ϵͳ���
        --����ԭʼ����, ˵���˶����ǳ����Ų�ֺ�Ķ���, ��Ҫͬ������ԭʼ���ŵ�״̬
        if s.is_original_sms = 1 then
          update sms_send set send_status = :new.sms_status, err_id = :new.gw_status, err_msg = v_err_msg, report_time = :new.report_time where send_id = s.originalsms_sendid and send_status = 1;
        end if;
    END LOOP;
    
    
END;
/

prompt
prompt Creating trigger TRIGGER_ORGANIZATION
prompt =====================================
prompt
create or replace trigger "MC"."TRIGGER_ORGANIZATION"  

after  insert or update or delete on organization
for each row
begin
       -- 0 ����ҪҪ���� 1 ���е����� 2 ���е��û�
     if inserting then
      	if :new.mo_type = 1 then
      		insert into white_org_config(org_id,mo_owner)values(:new.user_id,'ORG');
      	end if;
        if :new.mo_type = 2 then
      		insert into white_org_config(org_id,mo_owner)values(:new.user_id,'USER');
      	end if;
     elsif updating then
         if :new.mo_type != :old.mo_type then
            if(:new.mo_type = 1) then
        		  update white_org_config  set mo_owner = 'ORG' where org_id = :old.user_id;
            end if;
            if(:new.mo_type = 2) then
        		  update white_org_config  set mo_owner = 'USER' where org_id = :old.user_id;
            end if;
            if(:new.mo_type = 1) then
        		  delete from white_org_config  where org_id = :old.user_id;
            end if;
        end if;
     elsif deleting then
		       delete from white_org_config  where org_id = :old.user_id;
           delete from white_info t where t.org_id = :old.user_id;
     end if;

    exception
    when others then
        dbms_output.put_line('���������������쳣') ;
end;
/

prompt
prompt Creating trigger TRIGGER_RECEIVE_BEFORINSERT
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER mc."TRIGGER_RECEIVE_BEFORINSERT" --�����������, ��д��Ӧ������
BEFORE INSERT ON SMS_RECEIVE
For each row

DECLARE
  --��ѯ�ط���
  CURSOR SPNUMBER_CUR IS
    --SELECT * FROM SMS_SPNUMBER ORDER BY SPNUMBER ASC;
    SELECT * FROM SMS_SPNUMBER ORDER BY length(SPNUMBER) desc;
  --������չ��
  CURSOR org_cur IS
         SELECT *  from ORGANIZATION order by extend_number asc;
  --�û���չ��
  CURSOR user_cur IS
         SELECT *  from USER_INFO order by extend_number asc;


  --��ѯ�˶��ؼ���
  CURSOR KEY_CUR IS
    SELECT KEY_WORD
      FROM SMS_UNSUBSCRIBE_KEY_WORD
     WHERE STATUS = 1
     ORDER BY KEY_WORD ASC;

  --��ѯ�Ƿ��ǵ㲥����
  /*
  CURSOR RECDB_CUR IS
    SELECT DB_NAME, DB_CONTENT FROM RECBIZ_DB;
   */

  EXT            VARCHAR2(200); --��չ��
  ORGEXT         VARCHAR2(200);
  USEREXT        VARCHAR2(200);
  v_ok           VARCHAR2(200);
  v_orgid        VARCHAR2(200);
  v_userid        VARCHAR2(200);
BEGIN
  v_ok := '0';
  v_orgid := '';
  v_userid := '';


  --����receive_id
  IF :NEW.RECEIVE_ID IS NULL THEN
    :NEW.RECEIVE_ID := SMS_RECEIVE_SEQ.NEXTVAL;
  END IF;

  --ͨ��Ϊ14��������������
  if :new.channel_id = 14 then
     :new.org_id := 'ff8080813fa793ec013fa80e75de0001';
     :new.user_id := 'ff8080813fa793ec013fa80f2e810002';
  end if;
/*  54,55,56����֧����չ��
  54:���ݾ��� ;   55,56:��������ͨ��*/
  if :new.channel_id in (54,55,56,59) then
      select a.user_id, a.user_organization into :new.USER_ID,:new.ORG_ID
        from (select s.user_id,
                     s.user_organization,
                     row_number() over(order by s.sys_time desc) rn
                from send s
               where s.mobile_to = :new.MOBILE_FROM
                 and s.sys_time > sysdate - 14
                 and s.channel_id in (54, 55, 56,59)) a
       where rn = 1;
  end if;

  EXT := '';
  --��ѯ��Ӧ�Ķ�����Ϣ, ��дϵͳ���SYS_ID, MSG_ID

  --��ѯ�ط���, ������չ��,������ط��ţ���ôsp���ǳ�ȥ�ط��ŵ����к���
  FOR S IN SPNUMBER_CUR LOOP
    IF SUBSTR(:NEW.SP_NUM ,0, LENGTH(S.SPNUMBER)) = S.SPNUMBER THEN
      EXT := SUBSTR(:NEW.SP_NUM, LENGTH(S.SPNUMBER) + 1);
      :NEW.EXT_NUM := ext;
      EXIT;
    END IF;
  END LOOP;

  --INSERT INTO sql_log VALUES(EXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT');

  --���ݻ�����Ϣ��ȡ�������
  --ƥ�����, ��ȡ1λ, ��ȡ2λ, ���4λ
  v_ok := '0';
  IF length(ext) > 0 THEN
      BEGIN
        --֧�ֻ�����չ4λ
        --for i in 1..4 LOOP
        for i IN Reverse 1..5 LOOP
          IF v_ok = '1' THEN
             EXIT;
          END IF;
          IF length(ext) >= i THEN
            ORGEXT :=  SUBSTR(EXT, 0, i);
            --INSERT INTO sql_log VALUES('orgext ' || ORGEXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT 2');
            --ѭ�����
              FOR S IN org_cur LOOP
                IF length(s.extend_number) = i AND orgext = s.extend_number THEN
                  --��ȡʣ�µ���չ��
                  EXT := SUBSTR(EXT, i + 1, length(ext));
                  --INSERT INTO sql_log VALUES(EXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT ext');
                  v_orgid := s.user_id;
                  :new.Org_Id := s.user_id;
                  v_ok := '1';
                  EXIT;
                END IF;
              END LOOP;
          END IF;
        end loop;

        --INSERT INTO sql_log VALUES('userext ' || ORGEXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT ext2 = ' || ext);
        --�����û���չ�Ž�ȡ�û����
        --ȷ��������ȷ���û�
        IF v_ok = '1' THEN
          v_ok := '0';
          --for i in 1..4 LOOP
          for i in 1..4 LOOP
            IF v_ok = '1' THEN
               EXIT;
            END IF;
            IF length(ext) >= i THEN
              USEREXT :=  SUBSTR(EXT, 0, i);
              --INSERT INTO sql_log VALUES('userext ' || userEXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT userext = ' || userext );
              --ѭ�����
                FOR user_row IN user_cur LOOP
                  IF length(user_row.extend_number) = i AND userext = user_row.extend_number AND user_row.organization_id = v_orgid THEN
                    --��ȡʣ�µ���չ��
                    EXT := SUBSTR(EXT, i + 1, length(ext));
                    --INSERT INTO sql_log VALUES(EXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT final ext = ' || ext || ', userid = ' || user_row.user_id || ', userext = ' || userext || ', s.ext' ||user_row.extend_number);
                    v_userid := user_row.user_id;
                    :new.User_Id := user_row.user_id;
                    v_ok := '1';
                    EXIT;
                  END IF;
                END LOOP;
            END IF;
          end loop;
        END IF;
      END;
  END IF;



  --����������Ƿ����˶��ؼ���,�����Զ��Ӻ�����
  FOR S IN KEY_CUR LOOP
    IF INSTR(TRIM(:NEW.RECEIVE_MSG), TRIM(S.KEY_WORD), 1, 1) > 0 THEN
      --���˶��ؼ�����ʼ�Ķ���
      INSERT INTO BLACK
        (BLACK_ID, BLACK_MOBILE, BLACK_DESC, BLACK_TIME)
      VALUES
        (SYS_GUID(),
         :NEW.MOBILE_FROM,
         '�ÿͻ������˶��ؼ��֣�ϵͳ��' || TO_CHAR(SYSDATE, 'yyyy-MM-dd hh24:mi:ss') ||
         '�Զ����ÿͻ����������',
         SYSDATE);
          exit;
    END IF;
   
  END LOOP;

  --��������������������û�������û�ʱ�������û�������ԱΪ�������û�
  if :new.org_id is not null and :new.user_id is null then
     select t.user_id into :new.user_id from user_info t where t.organization_id = :new.org_id and t.user_type = 1 and rownum <= 1;
  end if;

  --��֤�ȵ��������
  if INSTR(TRIM(:NEW.Sp_Num), '106903590528', 1, 1) = 1 then
     :new.org_id := 'ff8080814577e4ed0145cf15467f439e';
     :new.user_id := 'ff808081463c75c0014641d8dc5c072c';
  end if;

  /*
  --��ѯ���ж����������Ƿ�����㲥������
  FOR S IN RECDB_CUR LOOP
    IF NLS_UPPER(TRIM(:NEW.RECEIVE_MSG)) = S.DB_NAME THEN
      :NEW.MSG_KEY   := 1;
      :NEW.REPLY_MSG := S.DB_CONTENT;
      -- P_DIANBO_SEND(:new.mobile_from,s.db_content,sp);--��������ʱ���в���һ������
    END IF;
  END LOOP;
  */
EXCEPTION
  WHEN OTHERS THEN
    NULL;
END;
/

prompt
prompt Creating trigger TRIGGER_REPORT_SEND
prompt ====================================
prompt
CREATE OR REPLACE TRIGGER "MC"."TRIGGER_REPORT_SEND" --�������״̬����, ��д��Ӧ������
AFTER UPDATE ON send
For each row
DECLARE
    pragma autonomous_transaction;
    v_spnumber VARCHAR2(20);

--��Ҫ״̬����Ļ���
BEGIN

       --�������, ״̬������޵��У� ״̬Ϊ�ɹ�����ʧ��
      if :NEW.report is not null and :old.report is null and :NEW.send_status in(5,6) AND  substr(:NEW.Msg_Type,1,4) = 'CMPP' and :new.report != 'IA:0006' THEN
         --��̬����channel_id ���ط���
         SELECT ac.sp_number||nvl(:OLD.SP_SERV_NO,'') INTO v_spnumber
                FROM sgw_account_channel ac
                inner JOIN sgw_account_info cmpp ON ac.sgw_id = cmpp.sgw_id
                                                   AND cmpp.user_id = :OLD.user_id
                WHERE ac.channel_id = :OLD.channel_id AND ac.mobile_com = :OLD.mobile_com ;

                --�ж��Ƿ���͸������
                --͸������
                IF :OLD.ORIGINALSMS_SENDID IS NOT NULL THEN
                    --�ò�ֶ��ŵ�״̬������ԭʼ���ŵ�״̬
                    UPDATE send send SET send.send_status = :new.send_status,
                                         send.report      = :new.report,
                                         send.report_time = :new.report_time
                                   WHERE
                                         send.send_id     = :old.ORIGINALSMS_SENDID
                                    AND  send.send_status !=5;
                    --���������Ӽ�¼
                    insert into SGW_REPORT_TASK (task_id, send_id, mobile_to, stat, destnation_id, user_organization, user_id, channel_id, report_time, push_status, next_push_time, push_times,sys_time, submit_time, done_time)
                    values(SGW_REPORT_TASK_SEQ.NEXTVAL, :old.ORIGINALSMS_SENDID, :new.mobile_to, :new.report, v_spnumber || :new.sp_serv_no, :new.user_organization, :new.user_id, :new.channel_id, :new.report_time, 0, sysdate, 0,sysdate, sysdate, sysdate);

                ELSE  --��͸������
                    --���������Ӽ�¼
                    insert into SGW_REPORT_TASK (task_id, send_id, mobile_to, stat, destnation_id, user_organization, user_id, channel_id, report_time, push_status, next_push_time, push_times,sys_time, submit_time, done_time)
                    values(SGW_REPORT_TASK_SEQ.NEXTVAL, :new.send_id, :new.mobile_to, :new.report, v_spnumber || :new.sp_serv_no, :new.user_organization, :new.user_id, :new.channel_id, :new.report_time, 0, sysdate, 0,sysdate, sysdate, sysdate);

                END IF;
         commit;
      end if;


END;
/

prompt
prompt Creating trigger TRIGGER_WHITE_ORG_CONFIG
prompt =========================================
prompt
create or replace trigger "MC"."TRIGGER_WHITE_ORG_CONFIG"  

after  insert or update or delete on white_org_config
for each row
begin
     if inserting or updating then
         if :new.mo_owner = 'ORG' then
    		    update organization o set o.mo_type = 1  where o.user_id = :new.org_id;
         end if;
         if :new.mo_owner = 'USER' then
    		    update organization o set o.mo_type = 2  where o.user_id = :new.org_id;
         end if;
     elsif deleting then
           update organization o set o.mo_type = 0  where o.user_id = :old.org_id;
     end if;

    exception
    when others then
        dbms_output.put_line('�������������ô����������쳣') ;
end;
/


spool off
