(*Joris Cuny & Mahamat Bokhit*)

print_endline("STEP 1: BY COMPARING DATA LEAKS");;

print_endline("Fetching Slogram...");;
let slogram01 = "wordlists/slogram01.txt";;
let slogram02 = "wordlists/slogram02.txt";;
let slogram_with_duplicates = Func.concatenate_files slogram01 slogram02;;
let slogram = Func.remove_duplicates slogram_with_duplicates;;
print_endline("Slogram ready !");;

print_endline("Fetching tetedamis...");;
let tetedamis01 = "wordlists/tetedamis01.txt";;
let tetedamis02 = "wordlists/tetedamis02.txt";;
let tetedamis_with_duplicates = Func.concatenate_files tetedamis01 tetedamis02;;
let tetedamis = Func.remove_duplicates tetedamis_with_duplicates;;
print_endline("Tetedamis ready !");;

print_endline("Fetching depensetout...");;
let depensetout01 = "wordlists/depensetout01.txt";;
let depensetout02 = "wordlists/depensetout02.txt";;
let depensetout_with_duplicates = Func.concatenate_files depensetout01 depensetout02;;
let depensetout_unhashed = Func.remove_duplicates depensetout_with_duplicates;;
let depensetout = Func.hash_every_password(depensetout_unhashed);;
print_endline("depensetout ready !");;

print_endline("Analyzing Slogram hashed password...");;
let slogram_depensetout = Func.concatenate_lists slogram depensetout;;
let slogram_depensetout_duplicates = Func.find_duplicates slogram_depensetout;;
print_endline("Extracting clear password from slogram...");;
let slogram_clear = Func.extract_clear_password slogram_depensetout_duplicates depensetout_unhashed;;
print_endline("Done !");;

print_endline("Analyzing tetedamis hashed password...");;
let tetedamis_depensetout = Func.concatenate_lists tetedamis depensetout;;
let tetedamis_depensetout_duplicates = Func.find_duplicates tetedamis_depensetout;;
print_endline("Extracting clear password from tetedamis...");;
let tetedamis_clear = Func.extract_clear_password tetedamis_depensetout_duplicates depensetout_unhashed;;
print_endline("Done !");;

print_endline("STEP 2: WITH TOP200000 WORDLIST");;

print_endline("Preparing password list...");;
let passwords = Func.read_passwords_from_file "wordlists/french_passwords_top20000.txt";;
let passwords_hashed = Func.hash_french_passwords passwords;;
let pass_hashmap = Func.combine_lists passwords passwords_hashed;;
print_endline("Done!");;

print_endline("Extracting from slogram...");;
let pass_slogram = Func.extract_clear_password_compare_hash pass_hashmap slogram;;
print_endline("Extracting from tetedamis...");;
let pass_tetedamis = Func.extract_clear_password_compare_hash pass_hashmap tetedamis;;
print_endline("Adding to results...");;
let slogram_answer_top20k = Func.create_triples "Slogram" pass_slogram;;
let tetedamis_answer_top20k = Func.create_triples "Tetedamis" pass_tetedamis;;

print_endline("Combining Results...");;
let slogram_answer = Func.create_triples "Slogram" slogram_clear;;
let tetedamis_answer = Func.create_triples "Tetedamis" tetedamis_clear;;
let answers = slogram_answer @ slogram_answer_top20k @ tetedamis_answer @ tetedamis_answer_top20k;;
print_endline("sanitizing data...");;
let answers_no_duplicates = Func.remove_duplicates_answer answers;;
print_endline("writing the results in results.txt...");;
Func.write_to_file "results.txt" answers_no_duplicates;;

print_endline("Done and done !");;
