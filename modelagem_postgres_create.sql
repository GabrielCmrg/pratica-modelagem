CREATE DATABASE "modelagem";



CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(60) NOT NULL,
	"email" varchar(80) NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"stock" integer NOT NULL,
	"size" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.photos" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"productId" integer NOT NULL,
	"isMain" BOOLEAN NOT NULL,
	CONSTRAINT "photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" varchar(30) NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.relations" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"categoryId" integer NOT NULL,
	CONSTRAINT "relations_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"userId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"status" integer NOT NULL DEFAULT 'created',
	"addressId" integer NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.addresses" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"street" TEXT NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" varchar(8) NOT NULL UNIQUE,
	"cityId" integer NOT NULL,
	CONSTRAINT "addresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.citites" (
	"id" serial NOT NULL,
	"stateId" integer NOT NULL,
	CONSTRAINT "citites_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchaseStatus" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "purchaseStatus_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("size") REFERENCES "sizes"("id");

ALTER TABLE "photos" ADD CONSTRAINT "photos_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");


ALTER TABLE "relations" ADD CONSTRAINT "relations_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "relations" ADD CONSTRAINT "relations_fk1" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("status") REFERENCES "purchaseStatus"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk3" FOREIGN KEY ("addressId") REFERENCES "addresses"("id");

ALTER TABLE "addresses" ADD CONSTRAINT "addresses_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_fk1" FOREIGN KEY ("cityId") REFERENCES "citites"("id");


ALTER TABLE "citites" ADD CONSTRAINT "citites_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");














