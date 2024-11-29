CREATE TABLE new_player_score AS
SELECT
    p1.id AS id,
    p1.tenant_id AS tenant_id,
    p1.player_id AS player_id,
    p1.competition_id AS competition_id,
    p1.score AS score,
    p1.row_num AS row_num,
    p1.created_at AS created_at,
    p1.updated_at AS updated_at
FROM player_score AS p1 JOIN (SELECT tenant_id, player_id, competition_id, MAX(row_num) AS max_row_num FROM player_score GROUP BY tenant_id, player_id, competition_id) AS p2 ON p1.tenant_id = p2.tenant_id AND p1.player_id = p2.player_id AND p1.competition_id = p2.competition_id AND p1.row_num = p2.max_row_num;
DROP TABLE player_score;
ALTER TABLE new_player_score RENAME TO player_score;
