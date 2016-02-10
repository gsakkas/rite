let rec assoc d k l =
  match k with
  | []            -> d
  | (lk,lv) :: ls ->
     if k = lk
     then lv
     else assoc d k ls

let _ = assoc (-1) "foo" [("bar", 1)]
