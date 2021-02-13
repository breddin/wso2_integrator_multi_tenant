-- Table: service_run_history

-- DROP TABLE service_run_history;

CREATE TABLE service_run_history
(
  tenant_id character varying(128) NOT NULL,
  service_id character varying(256) NOT NULL,
  service_run_id character varying(256) NOT NULL,
  service_segment character varying(256) NOT NULL,
  run_starttime timestamp with time zone,
  run_endtime timestamp with time zone,
  run_result character varying,
  run_comments character varying,
  segment_starttime timestamp with time zone NOT NULL,
  segment_endtime timestamp with time zone,
  segment_result character varying,
  segment_comments character varying,
  prev_run_starttime timestamp with time zone,
  segment_payload character varying,
  segment_payload_xml xml,
  segment_payload_json json,
  CONSTRAINT service_run_history_pk PRIMARY KEY (tenant_id, service_id, service_run_id, service_segment, segment_starttime)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE service_run_history
  OWNER TO cmpgadmin;

-- Index: idx_service_run_history

-- DROP INDEX idx_service_run_history;

CREATE INDEX idx_service_run_history
  ON service_run_history
  USING btree
  (tenant_id COLLATE pg_catalog."default", service_id COLLATE pg_catalog."default", service_run_id COLLATE pg_catalog."default", run_starttime, segment_starttime);

