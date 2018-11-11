LetG NonRec [LamG EmptyG] (LetG Rec [EmptyG] EmptyG)
let comb =
  fun a ->
    fun b ->
      match b with
      | [] -> [a]
      | hd :: tl -> [a + hd] in
let rec mBDhelper =
  fun i ->
    fun x ->
      match x with
      | [] -> []
      | hd :: tl -> if ((hd * i) - 9) <> 0
                    then ((hd * i) / 10) :: (comb ((hd * i) mod 10)
                                                  (mBDhelper i
                                                             tl))
                    else (hd * i) :: (mBDhelper i
                                                tl) in
mBDhelper i l
let comb =
  fun a ->
    fun b ->
      match b with
      | [] -> [a]
      | hd :: tl -> [a + hd] in
let rec mBDhelper =
  fun i ->
    fun x ->
      match x with
      | [] -> []
      | hd :: tl -> if ((hd * i) - 9) <> 0
                    then ((hd * i) / 10) :: (comb ((hd * i) mod 10)
                                                  (mBDhelper i
                                                             tl))
                    else (hd * i) :: (mBDhelper i
                                                tl) in
mBDhelper i l
let comb =
  fun a ->
    fun b ->
      match b with
      | [] -> [a]
      | hd :: tl -> [a + hd] in
let rec mBDhelper =
  fun i ->
    fun x ->
      match x with
      | [] -> []
      | hd :: tl -> if ((hd * i) - 9) <> 0
                    then ((hd * i) / 10) :: (comb ((hd * i) mod 10)
                                                  (mBDhelper i
                                                             tl))
                    else (hd * i) :: (mBDhelper i
                                                tl) in
mBDhelper i l
