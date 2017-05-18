
type 'a set =
  | Set of 'a list;;

let del x s = match s with | Set l -> Set (List.filter (fun z  -> z != x) l);;

let testee = Set ["z"];;

let _ = del 'z' testee;;
