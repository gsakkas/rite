
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (ki,vi)::t ->
      (Printf.fprintf 1 "%s, %d\n" ki vi;
       if ki == k then vi else assoc (d, k, t));;
