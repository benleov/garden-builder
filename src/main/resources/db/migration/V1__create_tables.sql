-- auto-generated definition
create table layout
(
  id   varchar(36)  not null
    primary key,
  name varchar(255) null
);

create table bed
(
  id   varchar(36)  not null
    primary key,
  name varchar(255) null
);

create table garden_row
(
  id varchar(36) not null
    primary key
);

create table plant
(
  id                           varchar(36)  not null
    primary key,
  emoji_code_point             varchar(255) null,
  full_size_url                varchar(255) null,
  median_days_to_first_harvest int          null,
  median_days_to_last_harvest  int          null,
  median_lifespan              int          null,
  name                         varchar(255) null,
  perennial                    bit          null,
  thumbnail_url                varchar(255) null,
  variety                      varchar(255) null
);

create table section
(
  id varchar(36) not null
    primary key
);


create table bed_rows
(
  bed_id  varchar(36) not null,
  rows_id varchar(36) not null,
  constraint UK_syqxvmmyj1f6ff9oa4xqf5e3m
    unique (rows_id),
  constraint FKds1a3drg7nnhde8x3007u1y0f
    foreign key (bed_id) references bed (id),
  constraint FKikst62ewhyb5plpdhd8kt8qw4
    foreign key (rows_id) references garden_row (id)
);

create table garden
(
  id        varchar(36)  not null
    primary key,
  season    varchar(255) null,
  layout_id varchar(36)  null,
  constraint FKe02q3lkdac07anlb4abjt1lnx
    foreign key (layout_id) references layout (id)
);

create table garden_row_sections
(
  garden_row_id varchar(36) not null,
  sections_id   varchar(36) not null,
  constraint UK_1n33dsg5kbtoi3ri11k5c9ltq
    unique (sections_id),
  constraint FKaoc9w88ekueem3mtww7ffyrus
    foreign key (sections_id) references section (id),
  constraint FKfnq9o67twhfc44do7pdlt7bhn
    foreign key (garden_row_id) references garden_row (id)
);

create table garden_section_states
(
  garden_id         varchar(36) not null,
  section_states_id varchar(36) not null,
  constraint UK_5qi9kclfnjh8tp4wqe0doxqah
    unique (section_states_id),
  constraint FKdfv2pwqpjme1hpjp975nj21ac
    foreign key (section_states_id) references section_state (id),
  constraint FKo8gmlcvd2lhr0mkchcnv4ypeb
    foreign key (garden_id) references garden (id)
);

create table layout_beds
(
  layout_id varchar(36) not null,
  beds_id   varchar(36) not null,
  constraint UK_jcxhee7ehxs3htm7jwq7246fx
    unique (beds_id),
  constraint FK56dwem5uurosi4lgignmdblx6
    foreign key (beds_id) references bed (id),
  constraint FKab3n6pw9jw1hq76cu7u3j0dnb
    foreign key (layout_id) references layout (id)
);

create table section_state
(
  id         varchar(36) not null
    primary key,
  plant_id   varchar(36) null,
  section_id varchar(36) null,
  constraint FK9ttb3kp2ft89be4ns7bufkuiu
    foreign key (plant_id) references plant (id),
  constraint FKa6lelewhbtb1khiaajvg6ke43
    foreign key (section_id) references section (id)
);
