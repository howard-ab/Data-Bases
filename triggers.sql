-- #1 Триггер:
create or replace function InsertHealthEncounter() return trigger as $$
begin
    insert into health_encounter(med_id, swimmer_id, permit, checkup_date)
    values (default, new.swimmer_id, false, null);
    return new;
end;
$$ language plpgsql;

create trigger new_swimmer_trigger
after insert on swimmer
for each row
execute function InsertHealthEncounter();
-- Этот триггер создает новую запись в таблице health_encounter с помощью оператора INSERT, задавая значения по умолчанию для med_id и permit, а также NULL для checkup_date. Затем он возвращает новую строку swimmer, чтобы выполнить вставку в swimmer. Триггер запускается после каждой вставки в swimmer (for each row).


------------------------------------------------------------------------------------------
-- #2 Триггер:
-- Триггер должен срабатывать при каждом изменении дат valid_from или valid_to в таблице team
-- При обновлении записи в таблице team нужно изменить дату valid_to в старой версии строки на дату изменения и вставить новую строку с актуальными данными, включая новые даты valid_from и valid_to
-- Если id записи в таблице team уже существует, необходимо обновить даты valid_from и valid_to в соответствующей строке

create trigger team_versioning_trigger
after insert or update on team
for each row
execute function TeamVersionin();

create or replace function TeamVersionin()
returns trigger as $$
begin
    if TG_OP = 'INSERT' then
        insert into team (swimmer_id, coach_id, contruct_nom, valid_from, valid_to)
        values (new.swimmer_id, new.coach_id, new.contruct_nom, new.valid_from, null);
    elseif TG_OP = 'UPDATE' then
        update team
        set valid_to = NEW.valid_from - interval '1 second'
        where swimmer_id = OLD.swimmer_id and valid_to is null;

        insert into team (swimmer_id, coach_id, contruct_nom, valid_from, valid_to)
        values (new.swimmer_id, new.coach_id, new.contruct_nom, new.valid_from, null)
        on conflict (swimmer_id) do update
        set valid_from = excluded.valid_from, valid_to = null;
    end if;

    return new;
end;
$$ language plpgsql;