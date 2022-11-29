create sequence user_sequence start 2 increment 1;

insert into usr(id, username, password, active)
            values (1, 'admin', '123', true);
insert into user_role(user_id, roles)
            values (1, 'ADMIN'),
                   (1, 'USER');