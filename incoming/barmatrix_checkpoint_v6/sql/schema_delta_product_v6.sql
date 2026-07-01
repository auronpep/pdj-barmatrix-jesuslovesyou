
-- BarMatrix C3 Product Checkpoint v6 schema delta
-- Focus: Dashboard Command Deck, LeadMe, Active Zones, Key/Trap Key system, Outline Atlas, Final Sprint.

CREATE TABLE IF NOT EXISTS weakness_profiles (
  weakness_profile_id VARCHAR(64) PRIMARY KEY,
  user_id VARCHAR(64) NOT NULL,
  subject VARCHAR(64),
  spine_code VARCHAR(32),
  red_axis_id VARCHAR(16),
  canonical_axis_template_id VARCHAR(128),
  purple_detail_id VARCHAR(16),
  blue_zone_id VARCHAR(16),
  mold_code VARCHAR(64),
  orange_zone_id VARCHAR(16),
  trap_dimension_id VARCHAR(32),
  key_gap_ids JSON,
  trap_key_gap_ids JSON,
  attempt_count INT DEFAULT 0,
  miss_count INT DEFAULT 0,
  recent_miss_count INT DEFAULT 0,
  high_confidence_miss_count INT DEFAULT 0,
  avg_time_seconds DECIMAL(8,2),
  status VARCHAR(32) NOT NULL,
  next_best_task_id VARCHAR(64),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS active_zones (
  active_zone_id VARCHAR(64) PRIMARY KEY,
  user_id VARCHAR(64) NOT NULL,
  ui_label VARCHAR(32) DEFAULT 'Red Zone',
  title VARCHAR(255) NOT NULL,
  zone_basis JSON NOT NULL,
  status VARCHAR(32) NOT NULL,
  damage_score DECIMAL(10,3) DEFAULT 0,
  recent_miss_count INT DEFAULT 0,
  high_confidence_wrong_count INT DEFAULT 0,
  primary_repair_path_id VARCHAR(64),
  next_task_id VARCHAR(64),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS daily_tasks (
  task_id VARCHAR(64) PRIMARY KEY,
  user_id VARCHAR(64) NOT NULL,
  task_source VARCHAR(64) NOT NULL,
  task_type VARCHAR(64) NOT NULL,
  title VARCHAR(255) NOT NULL,
  reason TEXT,
  priority_rank INT NOT NULL,
  required_today BOOLEAN DEFAULT TRUE,
  estimated_minutes DECIMAL(6,2),
  linked_assets JSON,
  display_in_dashboard_next_four BOOLEAN DEFAULT TRUE,
  available_in_leadme BOOLEAN DEFAULT TRUE,
  completion_status VARCHAR(32) DEFAULT 'open',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  completed_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS repair_queue_items (
  queue_item_id VARCHAR(64) PRIMARY KEY,
  user_id VARCHAR(64) NOT NULL,
  task_id VARCHAR(64),
  item_type VARCHAR(64) NOT NULL,
  title VARCHAR(255) NOT NULL,
  reason TEXT,
  priority_rank INT NOT NULL,
  start_route VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  completed_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS drill_picker_recommendations (
  recommendation_id VARCHAR(64) PRIMARY KEY,
  user_id VARCHAR(64) NOT NULL,
  task_type VARCHAR(64) NOT NULL,
  title VARCHAR(255) NOT NULL,
  reason TEXT,
  target JSON,
  estimated_minutes DECIMAL(6,2),
  priority_rank INT,
  confidence VARCHAR(32),
  display_in_dashboard_next_four BOOLEAN DEFAULT TRUE,
  available_in_leadme BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS leadme_modules (
  module_id VARCHAR(64) PRIMARY KEY,
  user_id VARCHAR(64) NOT NULL,
  title VARCHAR(255) NOT NULL,
  mode VARCHAR(32) NOT NULL,
  target_reason TEXT,
  linked_weakness_profile_ids JSON,
  linked_key_ids JSON,
  linked_spine_codes JSON,
  linked_color_signals JSON,
  completion_behavior JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS leadme_tasks (
  task_id VARCHAR(64) PRIMARY KEY,
  module_id VARCHAR(64),
  user_id VARCHAR(64),
  sequence_number INT,
  task_type VARCHAR(64) NOT NULL,
  title VARCHAR(255) NOT NULL,
  estimated_seconds INT,
  instruction TEXT,
  content JSON,
  required_response_type VARCHAR(64),
  linked_key_ids JSON,
  linked_question_ids JSON,
  linked_drill_ids JSON,
  completion_rule TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS leadme_runs (
  run_id VARCHAR(64) PRIMARY KEY,
  user_id VARCHAR(64) NOT NULL,
  module_id VARCHAR(64),
  mode VARCHAR(32) NOT NULL,
  source VARCHAR(64),
  started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ended_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS leadme_task_results (
  result_id VARCHAR(64) PRIMARY KEY,
  run_id VARCHAR(64) NOT NULL,
  task_id VARCHAR(64) NOT NULL,
  user_id VARCHAR(64) NOT NULL,
  result_status VARCHAR(32) NOT NULL,
  response JSON,
  elapsed_seconds INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS leadme_devotional_cards (
  card_id VARCHAR(64) PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  scripture TEXT NOT NULL,
  translation VARCHAR(32),
  virtue_tags JSON,
  one_sentence_exhortation TEXT,
  study_application TEXT,
  estimated_seconds INT DEFAULT 30,
  placement JSON,
  legal_content BOOLEAN DEFAULT FALSE,
  status VARCHAR(32) DEFAULT 'active'
);

CREATE TABLE IF NOT EXISTS key_master (
  key_id VARCHAR(128) PRIMARY KEY,
  key_title VARCHAR(255) NOT NULL,
  key_kind VARCHAR(64) NOT NULL,
  render_roles JSON,
  primary_render_role VARCHAR(64),
  subject_scope JSON,
  spine_scope JSON,
  color_scope JSON,
  student_statement TEXT,
  when_you_see TEXT,
  ask_this TEXT,
  default_move TEXT,
  why_it_works TEXT,
  decoy_or_trap_defeated TEXT,
  override_or_exception JSON,
  confidence VARCHAR(32),
  evidence JSON,
  lifecycle_status VARCHAR(32) DEFAULT 'draft',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS trap_key_profiles (
  key_id VARCHAR(128) PRIMARY KEY,
  student_label VARCHAR(32) DEFAULT 'Trap Key',
  decoy_phrase_patterns JSON,
  semantic_trigger_notes TEXT,
  distrust_by_default BOOLEAN DEFAULT TRUE,
  when_it_is_actually_right TEXT,
  common_wrong_context TEXT,
  typical_wrong_answer_shape TEXT,
  defeated_by JSON,
  trigger_exposure_rules JSON,
  student_warning TEXT,
  FOREIGN KEY (key_id) REFERENCES key_master(key_id)
);

CREATE TABLE IF NOT EXISTS key_examples (
  example_id VARCHAR(128) PRIMARY KEY,
  linked_key_ids JSON,
  title VARCHAR(255),
  mini_fact_pattern TEXT,
  student_prompt TEXT,
  correct_move TEXT,
  wrong_move_to_avoid TEXT,
  why_this_example_matters TEXT,
  source_question_ids JSON,
  leadme_ready BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS key_mnemonics (
  mnemonic_id VARCHAR(128) PRIMARY KEY,
  linked_key_id VARCHAR(128),
  phrase VARCHAR(255) NOT NULL,
  expands_to JSON,
  use_case TEXT,
  risk_note TEXT,
  leadme_ready BOOLEAN DEFAULT TRUE,
  final_sprint_ready BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS outline_access_nodes (
  spine_code VARCHAR(32) PRIMARY KEY,
  display_code VARCHAR(64) NOT NULL,
  legacy_outline_code VARCHAR(16),
  subject VARCHAR(64),
  subtopic VARCHAR(255),
  node_title VARCHAR(255),
  node_path TEXT,
  role VARCHAR(32) DEFAULT 'advanced_index',
  performance JSON,
  content JSON,
  linked_assets JSON,
  actions JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS final_sprint_snapshots (
  snapshot_id VARCHAR(64) PRIMARY KEY,
  user_id VARCHAR(64) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  exam_date DATE,
  scope_notes TEXT,
  weakness_summary JSON,
  selected_strategy JSON
);

CREATE TABLE IF NOT EXISTS final_sprint_sheets (
  sheet_id VARCHAR(64) PRIMARY KEY,
  snapshot_id VARCHAR(64) NOT NULL,
  day_number INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  theme TEXT,
  primary_goal TEXT,
  overload_level VARCHAR(32),
  priority_tiers JSON,
  mixed_targets JSON,
  completion_rule TEXT,
  delivery VARCHAR(32) DEFAULT 'web_first',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (snapshot_id) REFERENCES final_sprint_snapshots(snapshot_id)
);

CREATE TABLE IF NOT EXISTS answer_explanation_key_modules (
  module_id VARCHAR(64) PRIMARY KEY,
  question_id VARCHAR(64) NOT NULL,
  displayed_items JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_weakness_user_status ON weakness_profiles(user_id, status);
CREATE INDEX idx_active_zone_user_status ON active_zones(user_id, status);
CREATE INDEX idx_daily_tasks_user_rank ON daily_tasks(user_id, completion_status, priority_rank);
CREATE INDEX idx_key_primary_role ON key_master(primary_render_role, lifecycle_status);
