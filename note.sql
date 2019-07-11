 create table if not exists notes_group(
     id int primary key auto_increment comment '便签组编号',
     group_name varchar(10) unique comment '便签组名称',
     create_time datetime comment '创建时间',
     modify_time timestamp comment '修改时间',
     delete_time datetime comment '删除时间'
     );

create table if not exists notes(
     id int primary key auto_increment comment '便签标号',
     title varchar(20) not null comment '便签标题',
     content varchar(200) comment '便签内容',
     if_open boolean default 0 comment '是否私密，0：公开 1：私密',
     backup enum('红','黄','蓝','绿') default '绿' comment '背景颜色',
     if_call bit(1) default 0 comment '是否提醒 0：提醒 1：不提醒',
     if_delete char(1) default 0 comment '是否删除 0：不删除 1：删除',
     call_time datetime comment '提醒时间',
     create_time datetime comment '创建时间',
     modify_time timestamp comment '修改时间',
     delete_time datetime comment '删除时间',
     group_id int default 0 comment '便签组编号',
     foreign key(group_id) references notes_group(id)
     );

create table if not exists notes_share(
     id int primary key auto_increment comment '便签分享编号',
     note_id int not null comment '便签编号',
     share_mark varchar(50) comment '分享备注',
     share_time datetime comment '分享时间',
     delete_time datetime comment '删除时间',
     foreign key(note_id) references notes(id)
     );
