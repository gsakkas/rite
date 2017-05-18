
type 'a set =
  | Set of 'a list;;

let del x s = match s with | Set l -> Set (List.filter (fun z  -> not x) l);;

let testee = Set ["z"; "a"];;

let _ = del "z" testee;;
