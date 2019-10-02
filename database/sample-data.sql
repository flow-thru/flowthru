INSERT INTO public."user"(
	id, first_name)
	VALUES (1, 'adam', 'test@flowthru.com');

INSERT INTO public."user"(
	id, first_name, primary_email)
	VALUES (2, 'bob', 'test@flowthru.com');

INSERT INTO public."user"(
	id, first_name)
	VALUES (3, 'charlie', 'test@flowthru.com');

INSERT INTO public."user"(
	id, first_name)
	VALUES (4, 'david', 'test@flowthru.com');

INSERT INTO public."user"(
	id, first_name)
	VALUES (5, 'eugene', 'test@flowthru.com');

INSERT INTO public.organization(
	id, owner_id, name)
	VALUES (1, 1, 'adams org');

INSERT INTO public.organization(
	id, owner_id, name)
	VALUES (2, 2, 'bobs org');

INSERT INTO public.organization(
	id, owner_id, name)
	VALUES (3, 3, 'charlies org');

INSERT INTO public.organization(
	id, owner_id, name)
	VALUES (4, 4, 'davids org');

