CREATE TABLE new_player_score AS
SELECT id, tenant_id, player_id, competition_id, score, row_num, created_at, updated_at FROM player_score AS p1 JOIN (SELECT tenant_id, player_id, competition_id, MAX(row_num) AS max_row_num FROM player_score GROUP BY tenant_id, player_id, competition_id) AS p2 ON p1.tenant_id = p2.tenant_id AND p1.player_id = p2.player_id AND p1.competition_id = p2.competition_id AND p1.row_num = p2.max_row_num;
DROP TABLE player_score;
ALTER TABLE new_player_score RENAME TO player_score;
