
type 'a set =
  | Set of 'a list;;

let del x s =
  match s with | Set l -> Set (List.filter (fun z  -> z != "z") l);;

let testee = Set [2131; 123123; 4];;

let _ = del 4 testee;;
