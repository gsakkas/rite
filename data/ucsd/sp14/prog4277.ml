
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Nom of expr* expr* expr
  | Squa of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildNom (e,e1,e2) = Nom (e, e1, e2);;

let buildSine e = Sine e;;

let buildSqua e = Squa e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let res = (rand (0, 69)) mod 7 in
  match depth with
  | 0 -> if (res mod 2) = 0 then buildX () else buildY ()
  | _ ->
      let nd = depth - 1 in
      (match res with
       | 0 -> buildAverage ((build (rand, nd)), (build (rand, nd)))
       | 1 ->
           buildThresh
             ((build (rand, nd)), (build (rand, nd)), (build (rand, nd)),
               (build (rand, nd)))
       | 2 -> buildTimes ((build (rand, nd)), (build (rand, nd)))
       | 3 -> buildSine (build (rand, nd))
       | 4 -> buildCosine (build (rand, nd))
       | 5 -> buildSqua (build (rand, nd))
       | _ ->
           buildNom
             ((build (rand, nd)), (build (rand, nd)), (build (rand, nd))));;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let _ = build (makeRand (70, 69) 2);;
