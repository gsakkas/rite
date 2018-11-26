CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])
match helper with
| f -> if f = b
       then (f , false)
       else (f , true)
match helper with
| f -> if f = b
       then (f , false)
       else (f , true)
match ans with
| (num , tf) -> if tf = true
                then wwhile (f , num)
                else num
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
match res with
| (b' , c') -> if c'
               then acc b'
               else b'
match a with
| (o , z) -> if ((o + x1) + x2) > 9
             then (1 , (((o + x1) + x2) mod 10) :: z)
             else (0 , ((o + x1) + x2) :: z)
match a with
| (o , z) -> if ((o + x1) + x2) > 9
             then (1 , (((o + x1) + x2) mod 10) :: z)
             else (0 , ((o + x1) + x2) :: z)
match a with
| (o , z) -> if ((o + x1) + x2) > 9
             then (1 , (((o + x1) + x2) mod 10) :: z)
             else (0 , ((o + x1) + x2) :: z)
match a with
| (carry , result) -> if ((d1 + d2) + carry) > 9
                      then (1 , (((d1 + d2) + 1) - 10) :: result)
                      else (0 , (d1 + d2) :: result)
match x with
| (fir , sec) -> if (fir + sec) < 10
                 then ([] , (fir + sec) :: b2)
                 else ([] , (fir + sec) :: b2)
match x with
| (f , g) -> if ((f + g) + carry) > 9
             then 1
             else 0
match x with
| (f , g) -> if ((f + g) + carry) > 9
             then 1
             else 0
match a with
| (0 , acc) -> if (arg1 + arg2) > 9
               then (1 , ((arg1 + arg2) mod 10) :: acc)
               else (0 , (arg1 + arg2) :: acc)
| (0 , []) -> if (arg1 + arg2) > 9
              then (1 , [(arg1 + arg2) mod 10])
              else (0 , [arg1 + arg2])
| (_ , acc) -> if ((arg1 + arg2) + 1) > 9
               then (1 , (((arg1 + arg2) + 1) mod 10) :: acc)
               else (0 , ((arg1 + arg2) + 1) :: acc)
