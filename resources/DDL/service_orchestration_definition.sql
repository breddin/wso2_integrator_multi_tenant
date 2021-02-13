-- Table: service_orchestration_definition

-- DROP TABLE service_orchestration_definition;

CREATE TABLE service_orchestration_definition
(
  tenant_id character varying(128) NOT NULL,
  service_id character varying(256) NOT NULL,
  service_step integer NOT NULL,
  service_sequence character varying(2048),
  service_sequence_type integer,
  service_step_mode integer,
  service_step_environment integer NOT NULL,
  service_step_log_level character varying, -- FULL...
  service_step_exit_action character varying, -- DROP...
  service_step_api_response_test_node character varying,
  service_step_api_response_test_value character varying,
  service_step_direction character varying, -- IN...
  service_step_api_response_message character varying(256),
  service_step_api_response_test_type character varying, -- EXISTS - Test that the node exists and is non-empty...
  service_step_log_target character varying(16), -- eilog...
  CONSTRAINT pk_service_orchestration_definition PRIMARY KEY (tenant_id, service_id, service_step, service_step_environment)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE service_orchestration_definition
  OWNER TO cmpgadmin;
COMMENT ON COLUMN service_orchestration_definition.service_step_log_level IS 'FULL
SILENT
DEBUG';
COMMENT ON COLUMN service_orchestration_definition.service_step_exit_action IS 'DROP
CONTINUE';
COMMENT ON COLUMN service_orchestration_definition.service_step_direction IS 'IN
OUT';
COMMENT ON COLUMN service_orchestration_definition.service_step_api_response_test_type IS 'EXISTS - Test that the node exists and is non-empty
VALUE - Test that the node contains a specific value
REGEX - Test that the node contains a value specified by a Regex';
COMMENT ON COLUMN service_orchestration_definition.service_step_log_target IS 'eilog
filesystem
queue';
