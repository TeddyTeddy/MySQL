drop database if exists instagram_db;
create database instagram_db;
use instagram_db;

create table users (
	id int not null primary key auto_increment,
    username varchar(100) not null unique,
    created_at datetime default now()  not null
);

create table photos (
	id int not null primary key auto_increment,
    image_url text not null,
    user_id int not null,
    created_at datetime default now() not null,
    constraint FK_PhotosUsers foreign key(user_id) references users(id) on delete cascade
);

create table comments (
	id int not null primary key auto_increment,
    comment_text varchar(255) not null,
    user_id int not null,
    photo_id int not null,
    created_at datetime default now()  not null,
    constraint FK_CommentsUsers foreign key(user_id) references users(id) on delete cascade,
    constraint FK_CommentsPhotoes foreign key(photo_id) references photos(id) on delete cascade
);

create table likes (
    user_id int not null,
    photo_id int not null,
    constraint FK_LikesUsers foreign key(user_id) references users(id) on delete cascade,
    constraint FK_LikesPhotos foreign key(photo_id) references photos(id) on delete cascade,
    constraint only_one_like_per_photo unique ( user_id, photo_id )
);

create table followers (
	follower_id int not null,
    followee_id int not null,
    created_at datetime default now() not null,
	foreign key(follower_id) references users(id) on delete cascade,
    foreign key(followee_id) references users(id) on delete cascade,
    constraint cant_follow_itself check (follower_id != followee_id),
    constraint can_follow_only_once unique(follower_id, followee_id)
);


create table followees (
	follower_id int not null,
    followee_id int not null,
    created_at datetime default now()  not null,
	foreign key(follower_id) references users(id) on delete cascade,
    foreign key(followee_id) references users(id) on delete cascade,
    constraint cant_follow_itself check (follower_id != followee_id),
    constraint can_follow_only_once unique(follower_id, followee_id)
);

create table tags (
	id int not null primary key auto_increment,
    tag_name varchar(255) not null,
	created_at datetime default now() not null
);

create table photo_tags (
	photo_id int not null,
    tag_id int not null,
    constraint FK_PhotoTagsPhotos foreign key(photo_id) references photos(id) on delete cascade,
    constraint FK_PhotoTagsTags foreign key(tag_id) references tags(id) on delete cascade,
    constraint can_only_be_tagged_once unique(photo_id, tag_id)
);

