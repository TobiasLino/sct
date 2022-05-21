--liquibase formatted sql

--changeset: tslino: 201
--comment: insert users
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'requester1', 'requester1@gmail.com', '$2a$10$VZFDxMggGIqTFjOrwzkI9emzT3mVivKumK8O3SZDOqmejaL51gEiu', 'LOCAL', 'REQUESTER', '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya', null);
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'requester2', 'requester2@gmail.com', null, 'GOOGLE', 'REQUESTER', '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya', null);
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'requester3', 'requester3@gmail.com', '$2a$10$VZFDxMggGIqTFjOrwzkI9emzT3mVivKumK8O3SZDOqmejaL51gEiu', 'LOCAL', 'REQUESTER', '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya', null);
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'requester4', 'requester4@gmail.com', null, 'GOOGLE', 'REQUESTER', '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya', null);
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'driver1', 'driver1@gmail.com', '$2a$10$VZFDxMggGIqTFjOrwzkI9emzT3mVivKumK8O3SZDOqmejaL51gEiu', 'LOCAL', 'DRIVER', null, '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya');
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'driver2', 'driver2@gmail.com', null, 'GOOGLE', 'DRIVER', null, '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya');
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'driver3', 'driver3@gmail.com', '$2a$10$VZFDxMggGIqTFjOrwzkI9emzT3mVivKumK8O3SZDOqmejaL51gEiu', 'LOCAL', 'DRIVER', null, '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya');
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'driver4', 'driver4@gmail.com', null, 'GOOGLE', 'DRIVER', null, '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya');
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'manager1', 'manager1@gmail.com', '$2a$10$VZFDxMggGIqTFjOrwzkI9emzT3mVivKumK8O3SZDOqmejaL51gEiu', 'LOCAL', 'MANAGER', '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya', null);
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'manager2', 'manager2@gmail.com', '$2a$10$VZFDxMggGIqTFjOrwzkI9emzT3mVivKumK8O3SZDOqmejaL51gEiu', 'LOCAL', 'MANAGER', '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya', null);
INSERT INTO sct.sct_user (id_user, username, email, passwd, provider, user_type, cpf, cnh) VALUES (nextval('sct.sct_sq_user'), 'admin1', 'admin1@gmail.com', '$2a$10$VZFDxMggGIqTFjOrwzkI9emzT3mVivKumK8O3SZDOqmejaL51gEiu', 'LOCAL', 'ADMIN', null, null);

--changeset: tslino: 202
--comment: insert permissions
INSERT INTO sct.sct_permission (id_permission, name) VALUES (nextval('sct.sct_sq_permission'), 'REQUESTER');
INSERT INTO sct.sct_permission (id_permission, name) VALUES (nextval('sct.sct_sq_permission'), 'DRIVER');
INSERT INTO sct.sct_permission (id_permission, name) VALUES (nextval('sct.sct_sq_permission'), 'MANAGER');
INSERT INTO sct.sct_permission (id_permission, name) VALUES (nextval('sct.sct_sq_permission'), 'ADMIN');

--changeset: tslino: 203
--comment: grant permissions to users
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (1, 1);
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (2, 1);
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (3, 1);
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (4, 1);
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (5, 2);
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (6, 2);
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (7, 2);
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (8, 2);
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (9, 3);
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (10, 3);
INSERT INTO sct.sct_user_permission (id_user, id_permission) VALUES (11, 4);

--changeset: tslino: 204
--comment: insert suppliers
INSERT INTO sct.sct_supplier (id_supplier, name, cnpj, email) VALUES (nextval('sct.sct_sq_supplier'), 'supplier1', '$2a$10$aM0NAV68PHXC4C.d0cX/bODJKriVFKwLAAloIjIpl2U.Ad0eY8jya', 'contact@supplier1.com');
INSERT INTO sct.sct_supplier (id_supplier, name, cnpj, email) VALUES (nextval('sct.sct_sq_supplier'), 'supplier2', '$2a$10$BXo54df5xd3s83P1bhLkZ.fcCzHkd7wVVCTg7KrLhsZtadZ0vDojq', 'contact@supplier2.com');

--changeset: tslino: 205
--comment: link users to supplier
INSERT INTO sct.sct_supplier_user (id_supplier, id_user) VALUES (1, 5);
INSERT INTO sct.sct_supplier_user (id_supplier, id_user) VALUES (1, 6);
INSERT INTO sct.sct_supplier_user (id_supplier, id_user) VALUES (1, 9);
INSERT INTO sct.sct_supplier_user (id_supplier, id_user) VALUES (2, 7);
INSERT INTO sct.sct_supplier_user (id_supplier, id_user) VALUES (2, 8);
INSERT INTO sct.sct_supplier_user (id_supplier, id_user) VALUES (2, 10);

--changeset: tslino: 206
--comment: insert vehicles
INSERT INTO sct.sct_vehicle (id_vehicle, id_driver, year, name, license_plate) VALUES (nextval('sct.sct_sq_vehicle'), 5, 2020, 'Ford Fiesta', 'ABC-1S34');
INSERT INTO sct.sct_vehicle (id_vehicle, id_driver, year, name, license_plate) VALUES (nextval('sct.sct_sq_vehicle'), 6, 2010, 'For Ka', 'ABC-1S34');
INSERT INTO sct.sct_vehicle (id_vehicle, id_driver, year, name, license_plate) VALUES (nextval('sct.sct_sq_vehicle'), 7, 2019, 'Fiat Idea', 'ABC-1S34');
INSERT INTO sct.sct_vehicle (id_vehicle, id_driver, year, name, license_plate) VALUES (nextval('sct.sct_sq_vehicle'), 8, 2022, 'Jeep Renegade', 'ABC-1S34');

--changeset: tslino: 207
--comment: insert trips
INSERT INTO sct.sct_trip (id_trip, id_requester, id_vehicle, request_time, trip_start_time, estimated_trip_end_time, real_trip_end_time, price, origin, destination, distance)
VALUES (nextval('sct.sct_sq_trip'), 1, 1, '04/05/2022 13:12:04', '04/05/2022 13:19:08', '04/05/2022 13:57:00', '04/05/2022 14:00:31', 23.51);
