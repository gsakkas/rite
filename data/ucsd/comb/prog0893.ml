
let rec assoc (d,k,l) =
  match k with
  | [] -> d
  | (lk,lv)::ls -> if lk = lk then lv else assoc d k ls;;
