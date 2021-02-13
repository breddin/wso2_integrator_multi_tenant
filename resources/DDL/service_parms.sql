-- Table: service_parms

-- DROP TABLE service_parms;

CREATE TABLE service_parms
(
  tenant_id character varying(128) NOT NULL,
  service_id character varying(256) NOT NULL,
  pname character varying(256) NOT NULL,
  pvalue character varying(9128),
  service_env character varying NOT NULL,
  CONSTRAINT pk_service_parms PRIMARY KEY (tenant_id, service_id, service_env, pname)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE service_parms
  OWNER TO cmpgadmin;
