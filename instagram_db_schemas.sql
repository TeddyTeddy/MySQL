drop database instagram_db;
create database instagram_db;
use instagram_db;

create table users (
	id integer not null primary key auto_increment,
    username varchar(255) not null unique,
    created_at datetime not null default now()
);

-- how to store url in mysql?
-- https://stackoverflow.com/questions/219569/best-database-field-type-for-a-url
create table photos (
   id int not null primary key auto_increment,
   image_url varchar(2083) not null,
   user_id int not null,
   created_at datetime not null default now(),
   constraint FK_PhotosUsers foreign key(user_id) references users(id)
);

create table comments (
    id int not null primary key auto_increment,
    comment_text varchar(255) not null,
    user_id int not null,
    photo_id int not null,
    created_at datetime default now() not null,
    constraint FK_CommentsUsers  foreign key(user_id) references users(id) on delete cascade,
    constraint FK_CommentsPhotos  foreign key(photo_id) references photos(id) on delete cascade
);

create table likes (
    user_id int not null,
    photo_id int not null,
    created_at datetime default now() not null,
    constraint FK_LikesUsers  foreign key(user_id) references users(id) on delete cascade,
    constraint FK_LikesPhotos  foreign key(photo_id) references photos(id) on delete cascade,
    primary key(user_id, photo_id)
);

-- to ensure that follower_id = followee_id does not happen, one needs to use triggers. Section 18
create table follows (
	follower_id int not null,
    followee_id int not null,
    created_at datetime default now(),
    constraint FK_FollowsUsersOne foreign key(follower_id) references users(id) on delete cascade,
    constraint FK_FollowsUsersTwo foreign key(followee_id) references users(id) on delete cascade,
    primary key(follower_id, followee_id)
);

create table tags (
    id int not null primary key auto_increment,
    tag_name varchar(255) not null unique,
    created_at datetime default now() not null
);

create table photo_tags (
    photo_id int not null,
    tag_id int not null,
    constraint Photo_TagsPhotos foreign key(photo_id) references photos(id) on delete cascade,
    constraint Photo_TagsTags   foreign key(tag_id) references tags(id) on delete cascade,
    primary key(photo_id, tag_id)
);