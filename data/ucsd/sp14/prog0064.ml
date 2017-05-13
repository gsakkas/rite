
let rec sumList (l : int list) =
  (match l with
   | [] -> 0
   | hd::tl -> hd + ((sumList tl) failwith "TBD:sumList") : int);;
