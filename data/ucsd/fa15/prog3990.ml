
let x = [1; 2];;

let y = [2; 2];;

let rec addHelper t u =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper t t') @ [(1 + h') + h]
           else (addHelper t t') @ ([h' + h] addHelper x y));;
