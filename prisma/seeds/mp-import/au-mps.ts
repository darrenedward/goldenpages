/**
 * Australian MPs Seed
 *
 * Imports ~150 Australian MPs from the 2026 MP List PDF into the database.
 * Skips the 5 already-existing ministers (Albanese, Marles, Wong, Chalmers, Butler).
 * All MPs go under the "Australian Government" organisation with a shared
 * "House of Representatives" department.
 *
 * Run: npx tsx prisma/seeds/mp-import/au-mps.ts
 */

import 'dotenv/config';
import pg from 'pg';

const connectionString = process.env.DATABASE_URL!;
const AU_ORG_ID = 'au-govt-001';
const AU_HOUSE_DEPT_ID = 'au-dept-house-reps';
const NOW = new Date().toISOString();

// Already in DB — skip these
const EXISTING_CONTACTS = new Set([
  'Anthony Albanese',
  'Richard Marles',
  'Penny Wong',
  'Jim Chalmers',
  'Mark Butler',
]);

interface AUMP {
  fullName: string;
  honorific: string;
  electorate: string;
  roles: string[];
  party: string;
  address: string;
  city: string;
  state: string;
  postalCode: string;
  phone: string;
  email: string;
}

const mps: AUMP[] = [
  { fullName: 'Basem Abdo', honorific: 'Mr', electorate: 'Calwell', roles: ['Member for Calwell'], party: 'Australian Labor Party', address: '14 Dimboola Road', city: 'Broadmeadows', state: 'VIC', postalCode: '3047', phone: '(03) 9367 5216', email: 'Basem.Abdo.MP@aph.gov.au' },
  { fullName: 'Mary Aldred', honorific: 'Ms', electorate: 'Monash', roles: ['Deputy Chair of Standing Committee on Communications the Arts and Sport'], party: 'Liberal Party of Australia', address: '46C Albert Street', city: 'Waaragul', state: 'VIC', postalCode: '3820', phone: '(03) 5614 3600', email: 'Mary.Aldred.MP@aph.gov.au' },
  { fullName: 'Anne Aly', honorific: 'Hon. Dr', electorate: 'Cowan', roles: ['Minister for International Development', 'Minister for Multicultural Affairs'], party: 'Australian Labor Party', address: 'Shop 6A, Stirling Central Shopping Central, 478 Wanneroo Road', city: 'Westminster', state: 'WA', postalCode: '6061', phone: '(08) 9409 4517', email: 'Anne.Aly.MP@aph.gov.au' },
  { fullName: 'Ash Ambihaipahar', honorific: 'Ms', electorate: 'Barton', roles: ['Member for Barton'], party: 'Australian Labor Party', address: 'Level 2, 24 Montgomery Street', city: 'Kogarah', state: 'NSW', postalCode: '2217', phone: '(02) 9587 1555', email: 'Ash.Ambihaipahar.MP@aph.gov.au' },
  { fullName: 'David Batt', honorific: 'Mr', electorate: 'Flynn', roles: ['Deputy Nationals Whip'], party: 'Liberal National Party of Queensland', address: '41 Woongarra Street', city: 'Bundaberg', state: 'QLD', postalCode: '4670', phone: '(07) 4152 0744', email: 'David.Batt.MP@aph.gov.au' },
  { fullName: 'Angie Bell', honorific: 'Ms', electorate: 'Moncrieff', roles: ['Member for Moncrieff'], party: 'Liberal National Party of Queensland', address: '65-67 Thomas Drive', city: 'Chevron Island', state: 'QLD', postalCode: '4217', phone: '(07) 5504 6000', email: 'Angie.Bell.MP@aph.gov.au' },
  { fullName: 'Jodie Belyea', honorific: 'Ms', electorate: 'Dunkley', roles: ['Chair of Joint Standing Committee on Implementation of the National Redress Scheme'], party: 'Australian Labor Party', address: '37 Playne Street', city: 'Frankston', state: 'VIC', postalCode: '3199', phone: '(03) 9781 2333', email: 'Jodie.Belyea.MP@aph.gov.au' },
  { fullName: 'Carol Berry', honorific: 'Ms', electorate: 'Whitlam', roles: ['Member for Whitlam'], party: 'Australian Labor Party', address: 'Shop 244, Stockland Shopping Centre', city: 'Shellharbour', state: 'NSW', postalCode: '2529', phone: '(02) 4297 2285', email: 'Carol.Berry.MP@aph.gov.au' },
  { fullName: 'Sam Birrell', honorific: 'Mr', electorate: 'Nicholls', roles: ['Deputy Chair of Standing Committee on Education'], party: 'The Nationals Party', address: '426 Wyndham Street', city: 'Shepparton', state: 'VIC', postalCode: '3630', phone: '(03) 58215371', email: 'Sam.Birrell.MP@aph.gov.au' },
  { fullName: 'Nicolette Boele', honorific: 'Ms', electorate: 'Bradfield', roles: ['Member for Bradfield'], party: 'Independent', address: 'Suite 1, Level 2, 280 Pacific Highway', city: 'Lindfield', state: 'NSW', postalCode: '2070', phone: '(02) 9465 3950', email: 'Nicolette.Boele.MP@aph.gov.au' },
  { fullName: 'Chris Bowen', honorific: 'Hon', electorate: 'McMahon', roles: ['Minister for Climate Change and Energy'], party: 'Australian Labor Party', address: 'Shops 3 & 4, 398 Hamilton Road', city: 'Fairfield', state: 'NSW', postalCode: '2165', phone: '(02) 9604 0710', email: 'Chris.Bowen.MP@aph.gov.au' },
  { fullName: 'Colin Boyce', honorific: 'Mr', electorate: 'Flynn', roles: ['Member for Flynn'], party: 'Liberal National Party of Queensland', address: '76 Goondoon Street', city: 'Gladstone', state: 'QLD', postalCode: '4680', phone: '(07) 4972 5465', email: 'Colin.Boyce.MP@aph.gov.au' },
  { fullName: 'Jo Briskey', honorific: 'Ms', electorate: 'Maribyrnong', roles: ['Member for Maribyrnong'], party: 'Australian Labor Party', address: 'Suite 1A, 12 Hall Street', city: 'Moonee Ponds', state: 'VIC', postalCode: '3039', phone: '(03) 9326 1300', email: 'Jo.Briskey.MP@aph.gov.au' },
  { fullName: 'Scott Buchholz', honorific: 'Hon', electorate: 'Wright', roles: ['Deputy Chair of Joint Committee of Public Accounts and Audit'], party: 'Liberal National Party of Queensland', address: '21 William Street', city: 'Beaudesert', state: 'QLD', postalCode: '4285', phone: '(07) 5541 0154', email: 'Scott.Buchholz.MP@aph.gov.au' },
  { fullName: 'Tony Burke', honorific: 'Hon', electorate: 'Watson', roles: ['Minister for Home Affairs', 'Minister for the Arts', 'Minister for Cyber Security', 'Minister for Immigration and Citizenship', 'Leader of the House'], party: 'Australian Labor Party', address: 'Shop 29, Broadway Plaza', city: 'Punchbowl', state: 'NSW', postalCode: '2196', phone: '(02) 9750 9088', email: 'Tony.Burke.MP@aph.gov.au' },
  { fullName: 'Matt Burnell', honorific: 'Mr', electorate: 'Spence', roles: ['Member for Spence'], party: 'Australian Labor Party', address: 'Tenancy 8, 2-10 James Street', city: 'Salisbury', state: 'SA', postalCode: '5108', phone: '(08) 8258 6300', email: 'Matt.Burnell.MP@aph.gov.au' },
  { fullName: 'Josh Burns', honorific: 'Mr', electorate: 'Macnamara', roles: ['Chair of Joint Committee of Public Accounts and Audit'], party: 'Australian Labor Party', address: '219 Barkly Street', city: 'St Kilda', state: 'VIC', postalCode: '3182', phone: '(03) 9534 8126', email: 'Josh.Burns.MP@aph.gov.au' },
  { fullName: 'Alison Byrnes', honorific: 'Ms', electorate: 'Cunningham', roles: ['Member for Cunningham'], party: 'Australian Labor Party', address: '74 Crown Street', city: 'Wollongong', state: 'NSW', postalCode: '2500', phone: '(02) 4228 5899', email: 'Alison.Byrnes.MP@aph.gov.au' },
  { fullName: 'Cameron Caldwell', honorific: 'Mr', electorate: 'Fadden', roles: ['Opposition Whip'], party: 'Liberal National Party of Queensland', address: 'Unit 1, 110 Brisbane Road', city: 'Labrador', state: 'QLD', postalCode: '4215', phone: '(07) 5500 5919', email: 'Cameron.Caldwell.MP@aph.gov.au' },
  { fullName: 'Julie-Ann Campbell', honorific: 'Ms', electorate: 'Moreton', roles: ['Member for Moreton'], party: 'Australian Labor Party', address: 'Suite 106, Sunnybank Times Square, 250 McCullough Street', city: 'Sunnybank', state: 'QLD', postalCode: '4109', phone: '(07) 33442622', email: 'Julie-Ann.Campbell.MP@aph.gov.au' },
  { fullName: 'Jamie Chaffey', honorific: 'Mr', electorate: 'Parkes', roles: ['Deputy Chair of Standing Committee on Primary Industries'], party: 'The Nationals', address: 'Brookfield House 275 Argent St', city: 'Broken Hill', state: 'NSW', postalCode: '2880', phone: '(08) 8087 7649', email: 'Jamie.Chaffey.MP@aph.gov.au' },
  { fullName: 'Kate Chaney', honorific: 'Ms', electorate: 'Curtin', roles: ['Member for Curtin'], party: 'Independent', address: 'Shop 98 Floreat Forum Shopping Centre, 5 Howtree Place', city: 'Floreat', state: 'WA', postalCode: '6014', phone: '(08) 9388 0288', email: 'Kate.Chaney.MP@aph.gov.au' },
  { fullName: 'Andrew Charlton', honorific: 'Hon Dr', electorate: 'Parramatta', roles: ['Cabinet Secretary', 'Assistant Minister for Science, Technology and the Digital Economy'], party: 'Australian Labor Party', address: 'Shops 1 & 2, 25 Smith St', city: 'Parramatta', state: 'NSW', postalCode: '2150', phone: '(02) 6989 1455', email: 'Andrew.Charlton.MP@aph.gov.au' },
  { fullName: 'Darren Chester', honorific: 'Hon', electorate: 'Gippsland', roles: ['Member for Gippsland'], party: 'The Nationals', address: 'Level 1, 89 Raymond Street', city: 'Sale', state: 'VIC', postalCode: '3850', phone: '(03) 5144 6744', email: 'Darren.Chester.MP@aph.gov.au' },
  { fullName: 'Lisa Chesters', honorific: 'Ms', electorate: 'Bendigo', roles: ['Chair of Joint Standing Committee on Treaties'], party: 'Australian Labor Party', address: 'Cnr. Williamson & Myers Streets', city: 'Bendigo', state: 'VIC', postalCode: '3550', phone: '(03) 5443 9055', email: 'Lisa.Chesters.MP@aph.gov.au' },
  { fullName: 'Jason Clare', honorific: 'Hon', electorate: 'Blaxland', roles: ['Member for Blaxland'], party: 'Australian Labor Party', address: 'Suite 7 Level 1, 400 Chapel Road', city: 'Bankstown', state: 'NSW', postalCode: '2200', phone: '(02) 9790 2466', email: 'Jason.Clare.MP@aph.gov.au' },
  { fullName: 'Sharon Claydon', honorific: 'Ms', electorate: 'Newcastle', roles: ['Deputy Speaker'], party: 'Australian Labor Party', address: '427 Hunter Street', city: 'Newcastle', state: 'NSW', postalCode: '2300', phone: '(02) 4926 1555', email: 'Sharon.Claydon.MP@aph.gov.au' },
  { fullName: 'Claire Clutterham', honorific: 'Ms', electorate: 'Sturt', roles: ['Member for Sturt'], party: 'Australian Labor Party', address: 'Level 1, 85 The Parade', city: 'Norwood', state: 'SA', postalCode: '5067', phone: '(08) 8431 2277', email: 'Claire.Clutterham.MP@aph.gov.au' },
  { fullName: 'Renee Coffey', honorific: 'Ms', electorate: 'Griffith', roles: ['Member for Griffith'], party: 'Australian Labor Party', address: '76 Old Cleveland Road', city: 'Greenslopes', state: 'QLD', postalCode: '4120', phone: '(07) 3397 1674', email: 'Renee.Coffey.MP@aph.gov.au' },
  { fullName: 'Julie Collins', honorific: 'Hon', electorate: 'Franklin', roles: ['Minister for Agriculture, Fisheries and Forestry'], party: 'Australian Labor Party', address: '18 Ross Avenue', city: 'Rosny Park', state: 'TAS', postalCode: '7018', phone: '(03) 6244 1222', email: 'Julie.Colins.MP@aph.gov.au' },
  { fullName: 'Emma Comer', honorific: 'Ms', electorate: 'Petrie', roles: ['Member for Petrie'], party: 'Australian Labor Party', address: '40 Hornibrook Esplanade', city: 'Clontarf', state: 'QLD', postalCode: '4019', phone: '(07) 3284 8008', email: 'Emma.Comer.MP@aph.gov.au' },
  { fullName: 'Libby Coker', honorific: 'Ms', electorate: 'Corangamite', roles: ['Chair of Joint Standing Committee on the National Disability Insurance Scheme'], party: 'Australian Labor Party', address: '26/500-540 Torquay Road', city: 'Armstrong Creek', state: 'VIC', postalCode: '3217', phone: '(03) 5261 7683', email: 'Libby.Coker.MP@aph.gov.au' },
  { fullName: 'Pat Conaghan', honorific: 'Mr', electorate: 'Cowper', roles: ['Member for Cowper'], party: 'The Nationals', address: 'Level 4, 41-47 Horton Street', city: 'Port Macquarie', state: 'NSW', postalCode: '2444', phone: '(02) 6580 8387', email: 'Pat.Conaghan.MP@aph.gov.au' },
  { fullName: 'Pat Conroy', honorific: 'Hon', electorate: 'Shortland', roles: ['Minister for Defence Industry', 'Minister for Pacific Island Affairs'], party: 'Australian Labor Party', address: 'Suite 1A, 571 Pacific Highway', city: 'Belmont', state: 'NSW', postalCode: '2280', phone: '(02) 4947 9546', email: 'Pat.Conroy.MP@aph.gov.au' },
  { fullName: 'Kara Cook', honorific: 'Ms', electorate: 'Bonner', roles: ['Member for Bonner'], party: 'Australian Labor Party', address: '69 Clara Street', city: 'Wynnum', state: 'QLD', postalCode: '4178', phone: '(07) 3893 3488', email: 'Kara.Cook.MP@aph.gov.au' },
  { fullName: 'Trish Cook', honorific: 'Ms', electorate: 'Bullwinkel', roles: ['Member for Bullwinkel'], party: 'Australian Labor Party', address: 'Unit 2 and 3, 14-16 Mead Street', city: 'Kalamunda', state: 'WA', postalCode: '6076', phone: '(08) 7079 0480', email: 'Trish.Cook.MP@aph.gov.au' },
  { fullName: 'Milton Dick', honorific: 'Hon', electorate: 'Oxley', roles: ['Speaker'], party: 'Australian Labor Party', address: 'Unit 3, 205 Government Road', city: 'Richlands', state: 'QLD', postalCode: '4077', phone: '(07) 38796440', email: 'Milton.Dick.MP@aph.gov.au' },
  { fullName: 'Mary Doyle', honorific: 'Ms', electorate: 'Aston', roles: ['Chair of Publications Committee'], party: 'Australian Labor Party', address: 'Suite 4, Level 1, 420 Burwood Highway', city: 'Wantirna South', state: 'VIC', postalCode: '3152', phone: '(03) 9887 3890', email: 'Mary.Doyle.MP@aph.gov.au' },
  { fullName: 'Mark Dreyfus', honorific: 'Hon', electorate: 'Isaacs', roles: ['Member for Isaacs'], party: 'Australian Labor Party', address: '566 Main Street', city: 'Mordialloc', state: 'VIC', postalCode: '3195', phone: '(03) 9580 4651', email: 'Mark.Dreyfus.MP@aph.gov.au' },
  { fullName: 'Justine Elliot', honorific: 'Hon', electorate: 'Richmond', roles: ['Chair of Committee of Privileges and Members\' Interests'], party: 'Australian Labor Party', address: 'Suite 6, Hallmark Centre, 107-111 Minjungbal Drive', city: 'Tweed Heads South', state: 'NSW', postalCode: '2486', phone: '(07) 5523 4371', email: 'Justine.Elliot.MP@aph.gov.au' },
  { fullName: 'Cassandra Fernando', honorific: 'Ms', electorate: 'Holt', roles: ['Member for Holt'], party: 'Australian Labor Party', address: 'Shop 7, 1060 Thompsons Road', city: 'Cranborne West', state: 'VIC', postalCode: '3977', phone: '(03) 8790 0556', email: 'Cassandra.Fernando.MP@aph.gov.au' },
  { fullName: 'Ali France', honorific: 'Ms', electorate: 'Dickson', roles: ['Member for Dickson'], party: 'Australian Labor Party', address: '454 Gympie Road', city: 'Strathpine', state: 'QLD', postalCode: '4500', phone: '(07) 3205 9977', email: 'Ali.France.MP@aph.gov.au' },
  { fullName: 'Mike Freelander', honorific: 'Dr', electorate: 'Macarthur', roles: ['Chair of Standing Committee on Health, Aged Care and Disability'], party: 'Australian Labor Party', address: '37 Queen Street', city: 'Campbelltown', state: 'NSW', postalCode: '2560', phone: '(02) 4620 0293', email: 'Mike.Freelander.MP@aph.gov.au' },
  { fullName: 'Tom French', honorific: 'Mr', electorate: 'Moore', roles: ['Member for Moore'], party: 'Australian Labor Party', address: 'Suite 6, 129 Grand Boulevard', city: 'Joondalup', state: 'WA', postalCode: '6027', phone: '(08) 9300 2244', email: 'Tom.French.MP@aph.gov.au' },
  { fullName: 'Carina Garland', honorific: 'Dr', electorate: 'Chisholm', roles: ['Chair of Standing Committee on Employment, Workplace Relations, Skills and Training'], party: 'Australian Labor Party', address: 'Ground Floor, 257 Blackburn Road', city: 'Mount Waverley', state: 'VIC', postalCode: '3149', phone: '(03) 9808 3188', email: 'Carina.Garland.MP@aph.gov.au' },
  { fullName: 'Andrew Gee', honorific: 'Hon', electorate: 'Calare', roles: ['Member for Calare'], party: 'Independent', address: 'Suite 1/179A Anson Street', city: 'Orange', state: 'NSW', postalCode: '2800', phone: '(02) 6361 7138', email: 'Andrew.Gee.MP@aph.gov.au' },
  { fullName: 'Steve Georganas', honorific: 'Mr', electorate: 'Adelaide', roles: ['Chair of Joint Standing Committee on Migration'], party: 'Australian Labor Party', address: '161 Main North Road', city: 'Nailsworth', state: 'SA', postalCode: '5083', phone: '(08) 8269 2433', email: 'Steve.Georganas.MP@aph.gov.au' },
  { fullName: 'Andrew Giles', honorific: 'Mr', electorate: 'Scullin', roles: ['Minister for Skills and Training'], party: 'Australian Labor Party', address: '187-189 High Street', city: 'Thomastown', state: 'VIC', postalCode: '3074', phone: '(03) 9497 9783', email: 'Andrew.Giles.MP@aph.gov.au' },
  { fullName: 'Patrick Gorman', honorific: 'Hon', electorate: 'Perth', roles: ['Assistant Minister to the Prime Minister', 'Assistant Minister for the Public Service'], party: 'Australian Labor Party', address: 'Level 6, One The Esplanade', city: 'Perth', state: 'WA', postalCode: '6000', phone: '(08) 9272 3411', email: 'Patrick.Gorman.MP@aph.gov.au' },
  { fullName: 'Luke Gosling', honorific: 'Mr', electorate: 'Solomon', roles: ['Member for Solomon'], party: 'Australian Labor Party', address: '3/266 Trower Road', city: 'Casuarina', state: 'NT', postalCode: '0810', phone: '(08) 8928 0180', email: 'Luke.Gosling.MP@aph.gov.au' },
  { fullName: 'Matt Gregg', honorific: 'Mr', electorate: 'Deakin', roles: ['Member for Deakin'], party: 'Australian Labor Party', address: 'Unit 5, 602 Whitehorse Road', city: 'Mitcham', state: 'VIC', postalCode: '3132', phone: '(03) 7066 6599', email: 'Matthew.Bregg.MP@aph.gov.au' },
  { fullName: 'Helen Haines', honorific: 'Dr', electorate: 'Indi', roles: ['Deputy Chair of Parliamentary Joint Committee on the National Anti-Corruption Commission'], party: 'Independent', address: '117 Murphy Street', city: 'Wangaratta', state: 'VIC', postalCode: '3677', phone: '(03) 5721 7077', email: 'Helen.Haines.MP@aph.gov.au' },
  { fullName: 'Garth Hamilton', honorific: 'Mr', electorate: 'Groom', roles: ['Deputy Chair of Parliamentary Joint Committee on Corporations and Financial Services'], party: 'Liberal National Party of Queensland', address: '516 Ruthven Street', city: 'Toowoomba', state: 'QLD', postalCode: '4350', phone: '(07) 4632 4144', email: 'Garth.Hamilton.MP@aph.gov.au' },
  { fullName: 'Andrew Hastie', honorific: 'Hon', electorate: 'Canning', roles: ['Member for Canning'], party: 'Liberal Party of Australia', address: 'Unit 2, 61 Sutton Street', city: 'Mandurah', state: 'WA', postalCode: '6210', phone: '(08) 9534 8044', email: 'Andrew.Hastie.MP@aph.gov.au' },
  { fullName: 'Alex Hawke', honorific: 'Hon', electorate: 'Mitchell', roles: ['Deputy Chair of Standing Committee on Social Policy and Legal Affairs'], party: 'Liberal Party of Australia', address: 'Suite 8, 23 Terminus Street', city: 'Castle Hill', state: 'NSW', postalCode: '2154', phone: '(02) 9899 7211', email: 'Alex.Hawke.MP@aph.gov.au' },
  { fullName: 'Julian Hill', honorific: 'Hon', electorate: 'Bruce', roles: ['Assistant Minister for Citizenship, Customs and Multicultural Affairs'], party: 'Australian Labor Party', address: '45 Robinson Street', city: 'Dandenong', state: 'VIC', postalCode: '3175', phone: '(03) 9791 7770', email: 'Julian.Hill.MP@aph.gov.au' },
  { fullName: 'Kevin Hogan', honorific: 'Hon', electorate: 'Page', roles: ['Deputy Leader of the National Party'], party: 'The Nationals', address: '63 Molesworth Street', city: 'Lismore', state: 'NSW', postalCode: '2480', phone: '(02) 6621 4044', email: 'Kevin.Hogan.MP@aph.gov.au' },
  { fullName: 'Rowan Holzberger', honorific: 'Mr', electorate: 'Forde', roles: ['Member for Forde'], party: 'Australian Labor Party', address: '110-112 George Street', city: 'Beenleigh', state: 'QLD', postalCode: '4207', phone: '(07) 3807 6340', email: 'Rowan.Holzberger.MP@aph.gov.au' },
  { fullName: 'Ed Husic', honorific: 'Hon', electorate: 'Chifley', roles: ['Chair of Standing Committee on Economics'], party: 'Australian Labor Party', address: 'Shop 41 Plumpton Marketplace, Cnr Hyatts and Jersey Road', city: 'Plumpton', state: 'NSW', postalCode: '2761', phone: '', email: 'Ed.Husic.MP@aph.gov.au' },
  { fullName: 'Madonna Jarrett', honorific: 'Ms', electorate: 'Brisbane', roles: ['Member for Brisbane'], party: 'Australian Labor Party', address: '349 Sandgate Road', city: 'Albion', state: 'QLD', postalCode: '4010', phone: '(07) 3862 4044', email: 'Madonna.Jarrett.MP@aph.gov.au' },
  { fullName: 'Alice Jordan-Baird', honorific: 'Ms', electorate: 'Gordon', roles: ['Member for Gordon'], party: 'Australian Labor Party', address: 'Shop 3, 11 Commercial Road', city: 'Caroline Springs', state: 'VIC', postalCode: '3032', phone: '(03) 8390 6166', email: 'Alice.Jordan-Baird.MP@aph.gov.au' },
  { fullName: 'Barnaby Joyce', honorific: 'Hon', electorate: 'New England', roles: ['Member for New England'], party: 'One Nation', address: 'Suite 17, 454-456 Peel Street', city: 'Tamworth', state: 'NSW', postalCode: '2340', phone: '(02) 6761 3080', email: 'Barnaby.Joyce.MP@aph.gov.au' },
  { fullName: 'Bob Katter', honorific: 'Hon', electorate: 'Kennedy', roles: ['Member for Kennedy'], party: "Katter's Australian Party", address: '14-20 Rankin Street', city: 'Innisfail', state: 'QLD', postalCode: '4860', phone: '(07) 4061 6066', email: 'Bob.Katter.MP@aph.gov.au' },
  { fullName: 'Ged Kearney', honorific: 'Hon', electorate: 'Cooper', roles: ['Assistant Minister for Social Services'], party: 'Australian Labor Party', address: '159 High Street', city: 'Preston', state: 'VIC', postalCode: '3072', phone: '', email: 'Ged.Kearney.MP@aph.gov.au' },
  { fullName: 'Simon Kennedy', honorific: 'Mr', electorate: 'Cook', roles: ['Deputy Chair of Standing Committee on Economics'], party: 'Liberal Party of Australia', address: 'Suite 102, Level 1, 30 The Kingsway', city: 'Cronulla', state: 'NSW', postalCode: '2230', phone: '', email: 'Simon.Kennedy.MP@aph.gov.au' },
  { fullName: 'Matt Keogh', honorific: 'Hon', electorate: 'Burt', roles: ['Minister for Defence Personnel', "Minister for Veterans' Affairs"], party: 'Australian Labor Party', address: 'Unit 2, 2808 Albany Highway', city: 'Kelmscott', state: 'WA', postalCode: '6111', phone: '(08) 9390 0180', email: 'Matt.Keogh.MP@aph.gov.au' },
  { fullName: 'Peter Khalil', honorific: 'Hon', electorate: 'Wills', roles: ['Assistant Minister of Defence'], party: 'Australian Labor Party', address: '466-468 Sydney Road', city: 'Coburg', state: 'VIC', postalCode: '3058', phone: '(03) 9350 5777', email: 'Peter.Khalil.MP@aph.gov.au' },
  { fullName: 'Catherine King', honorific: 'Hon', electorate: 'Ballarat', roles: ['Minister for Infrastructure, Transport, Regional Development and Local Government'], party: 'Australian Labor Party', address: '5 Lydiard Street North', city: 'Ballarat', state: 'VIC', postalCode: '3350', phone: '', email: 'Catherine.King.MP@aph.gov.au' },
  { fullName: 'Madeleine King', honorific: 'Hon', electorate: 'Brand', roles: ['Minister for Resources', 'Minister for Northern Australia'], party: 'Australian Labor Party', address: 'Unit 1 & 2, 1-3 Kent Street', city: 'Rockingham', state: 'WA', postalCode: '6168', phone: '(08) 9527 9277', email: 'Madeleine.King.MP@aph.gov.au' },
  { fullName: 'Michelle Landry', honorific: 'Hon', electorate: 'Capricornia', roles: ['Chief Nationals Whip'], party: 'Liberal National Party of Queensland', address: '3/71-73 Denham Street', city: 'Rockhampton', state: 'QLD', postalCode: '4700', phone: '(07) 4922 6604', email: 'Michelle.Landry.MP@aph.gov.au' },
  { fullName: 'Tania Lawrence', honorific: 'Ms', electorate: 'Hasluck', roles: ['Member for Hasluck'], party: 'Australian Labor Party', address: 'Shop 2, 257 Great Eastern Highway', city: 'Midland', state: 'WA', postalCode: '6056', phone: '', email: 'Tania.Lawrence.MP@aph.gov.au' },
  { fullName: 'Jerome Laxale', honorific: 'Mr', electorate: 'Bennelong', roles: ['Chair of Joint Standing Committee on Electoral Matters'], party: 'Australian Labor Party', address: '32 Beecroft Road', city: 'Epping', state: 'NSW', postalCode: '2121', phone: '(02) 9869 4288', email: 'Jerome.Laxale.MP@aph.gov.au' },
  { fullName: 'Dai Le', honorific: 'Ms', electorate: 'Fowler', roles: ['Member for Fowler'], party: 'Independent', address: '270 Canley Vale Road', city: 'Canley Heights', state: 'NSW', postalCode: '2166', phone: '', email: 'Dai.Le.MP@aph.gov.au' },
  { fullName: 'Julian Leeser', honorific: 'Mr', electorate: 'Berowra', roles: ['Member for Berowra'], party: 'Liberal Party of Australia', address: 'Level 11, 423 Pennant Hills Road', city: 'Pennant Hills', state: 'NSW', postalCode: '2120', phone: '(02) 9980 1822', email: 'Julian.Leeser.MP@aph.gov.au' },
  { fullName: 'Andrew Leigh', honorific: 'Hon Dr', electorate: 'Fenner', roles: ['Assistant Minister for Productivity, Competition, Charities and Treasury'], party: 'Australian Labor Party', address: 'Cnr Gungahlin Pl & Efkarpidis St', city: 'Gungahlin', state: 'ACT', postalCode: '2912', phone: '(02) 6247 4396', email: 'Andrew.Leigh.MP@aph.gov.au' },
  { fullName: 'Sam Lim', honorific: 'Mr', electorate: 'Tangney', roles: ['Member for Tangney'], party: 'Australian Labor Party', address: '6 Aveley Street', city: 'Willetton', state: 'WA', postalCode: '6155', phone: '(08) 9354 9633', email: 'Sam.Lim.MP@aph.gov.au' },
  { fullName: 'David Littleproud', honorific: 'Hon', electorate: 'Maranoa', roles: ['Leader of the Nationals'], party: 'Liberal National Party of Queensland', address: 'T40-42 Dalby Shopping World, 17-67 Cunningham Street', city: 'Dalby', state: 'QLD', postalCode: '4405', phone: '', email: 'David.Littleproud.MP@aph.gov.au' },
  { fullName: 'Zaneta Mascarenhas', honorific: 'Ms', electorate: 'Swan', roles: ['Chair of Parliamentary Joint Committee on Human Rights'], party: 'Australian Labor Party', address: 'G3, 59 Albany Highway', city: 'Victoria Park', state: 'WA', postalCode: '6101', phone: '(08) 9355 0099', email: 'Zaneta.Mascarenhas.MP@aph.gov.au' },
  { fullName: 'Kristy McBain', honorific: 'Hon', electorate: 'Eden-Monaro', roles: ['Minister for Emergency Management', 'Minister for Regional Development, Local Government and Territories'], party: 'Australian Labor Party', address: '1/21-25 Monaro Street', city: 'Queanbeyan', state: 'NSW', postalCode: '2620', phone: '(02) 6284 2442', email: 'Kristy.McBain.MP@aph.gov.au' },
  { fullName: 'Emma McBride', honorific: 'Hon', electorate: 'Dobell', roles: ['Assistant Minister for Mental Health and Suicide Prevention'], party: 'Australian Labor Party', address: 'T6-T7, Village Central, 18-34 Alison Road', city: 'Wyong', state: 'NSW', postalCode: '2259', phone: '(02) 4353 0127', email: 'Emma.McBride.MP@aph.gov.au' },
  { fullName: 'Michael McCormack', honorific: 'Hon', electorate: 'Riverina', roles: ['Deputy Chair of Standing Committee on Industry, Innovation and Science'], party: 'The Nationals', address: 'Suite 2, 11-15 Fitzmaurice Street', city: 'Wagga Wagga', state: 'NSW', postalCode: '2650', phone: '(02) 6921 4600', email: 'Michael.McCormack.MP@aph.gov.au' },
  { fullName: 'Melissa McIntosh', honorific: 'Hon', electorate: 'Lindsay', roles: ['Member for Lindsay'], party: 'Liberal Party of Australia', address: 'Ground Floor, 331 High Street', city: 'Penrith', state: 'NSW', postalCode: '2750', phone: '', email: 'Melissa.McIntosh.MP@aph.gov.au' },
  { fullName: 'Zoe McKenzie', honorific: 'Ms', electorate: 'Flinders', roles: ['Deputy Chair of Joint Standing Committee on Treaties'], party: 'Liberal Party of Australia', address: '1/49 Eramosa Road West', city: 'Somerville', state: 'VIC', postalCode: '3912', phone: '(03) 5977 9082', email: 'Zoe.McKenzie.MP@aph.gov.au' },
  { fullName: 'Louise Miller-Frost', honorific: 'Ms', electorate: 'Boothby', roles: ['Chair of Standing Committee on Social Policy and Legal Affairs'], party: 'Australian Labor Party', address: 'Shop 2, 670 ANZAC Highway', city: 'Glenelg', state: 'SA', postalCode: '5045', phone: '(08) 8374 0511', email: 'Louise.Miller-Frost.MP@aph.gov.au' },
  { fullName: 'Rob Mitchell', honorific: 'Mr', electorate: 'McEwen', roles: ['Chair of Standing Committee on Industry, Innovation and Science'], party: 'Australian Labor Party', address: '57-59 High Street', city: 'Wallan', state: 'VIC', postalCode: '3756', phone: '(03) 5716 3000', email: 'Rob.Mitchell.MP@aph.gov.au' },
  { fullName: 'David Moncrieff', honorific: 'Mr', electorate: 'Hughes', roles: ['Member for Hughes'], party: 'Australian Labor Party', address: 'Shop 1, 9-15 East Parade', city: 'Sutherland', state: 'NSW', postalCode: '2232', phone: '(02) 9521 6262', email: 'David.Moncrieff.MP@aph.gov.au' },
  { fullName: 'Daniel Mulino', honorific: 'Hon Dr', electorate: 'Fraser', roles: ['Assistant Treasurer', 'Minister for Financial Services'], party: 'Australian Labor Party', address: 'Shop 1, 25-27 Clarke Street', city: 'Sunshine', state: 'VIC', postalCode: '3020', phone: '(03) 9070 1974', email: 'Daniel.Mulino.MP@aph.gov.au' },
  { fullName: 'Shayne Neumann', honorific: 'Hon', electorate: 'Blair', roles: ['Chair of Joint Standing Committee on Foreign Affairs, Defence and Trade'], party: 'Australian Labor Party', address: 'Level 1, The Tarpaulin Building, 2 The Terrace Riverlink Shopping Centre', city: 'North Ipswich', state: 'QLD', postalCode: '4305', phone: '(07) 3201 5300', email: 'Shayne.Neumann.MP@aph.gov.au' },
  { fullName: 'Gabriel Ng', honorific: 'Mr', electorate: 'Menzies', roles: ['Member for Menzies'], party: 'Australian Labor Party', address: 'Level 1, 651-653 Doncaster Road', city: 'Doncaster', state: 'VIC', postalCode: '3108', phone: '(03) 7066 6590', email: 'Gabriel.Ng.MP@aph.gov.au' },
  { fullName: "Ted O'Brien", honorific: 'Mr', electorate: 'Fairfax', roles: ['Deputy Leader of the Opposition'], party: 'Liberal National Party of Queensland', address: '17 Southern Drive', city: 'Maroochydore', state: 'QLD', postalCode: '4558', phone: '(07) 5479 2800', email: 'Ted.Obrien.MP@aph.gov.au' },
  { fullName: "Llew O'Brien", honorific: 'Mr', electorate: 'Wide Bay', roles: ['Member for Wide Bay'], party: 'Liberal National Party of Australia', address: '319 Kent Street', city: 'Maryborough', state: 'QLD', postalCode: '4650', phone: '(07) 4121 2936', email: 'Llew.Obrien.MP@aph.gov.au' },
  { fullName: "Clare O'Neil", honorific: 'Hon', electorate: 'Hotham', roles: ['Minister for Housing', 'Minister for Homelessness', 'Minister for Cities'], party: 'Australian Labor Party', address: '17-19 Atherton Road', city: 'Oakleigh', state: 'VIC', postalCode: '3166', phone: '(03) 9545 6211', email: 'Clare.Oneil.MP@aph.gov.au' },
  { fullName: 'Tony Pasin', honorific: 'Mr', electorate: 'Barker', roles: ['Member for Barker'], party: 'Liberal Party of Australia', address: '27 Commercial Street', city: 'Mt Gambier', state: 'SA', postalCode: '5290', phone: '(08) 8724 7730', email: 'Tony.Pasin.MP@aph.gov.au' },
  { fullName: 'Alicia Payne', honorific: 'Ms', electorate: 'Canberra', roles: ['Chair of Joint Standing Committee on the National Capital and External Territories'], party: 'Australian Labor Party', address: '211 London Circuit', city: 'Canberra', state: 'ACT', postalCode: '2601', phone: '(02) 6247 8475', email: 'Alicia.Payne.MP@aph.gov.au' },
  { fullName: 'Alison Penfold', honorific: 'Ms', electorate: 'Lyne', roles: ['Deputy Chair of Standing Committee on Regional Development, Infrastructure and Transport'], party: 'The Nationals', address: 'Shop 2 & 3, 43 High Street', city: 'Wauchope', state: 'NSW', postalCode: '2446', phone: '(02) 6586 4462', email: 'Alison.Penfold.MP@aph.gov.au' },
  { fullName: 'Fiona Phillips', honorific: 'Mrs', electorate: 'Gilmore', roles: ['Chair of Standing Committee on Regional Development, Infrastructure and Transport'], party: 'Australian Labor Party', address: 'Unit 3, 59 Junction Street', city: 'Nowra', state: 'NSW', postalCode: '2541', phone: '(02) 4423 1782', email: 'Fiona.Phillips.MP@aph.gov.au' },
  { fullName: 'Henry Pike', honorific: 'Mr', electorate: 'Bowman', roles: ['Opposition Whip'], party: 'Liberal National Party of Queensland', address: 'Ground Floor, Unit 1, 124 Queens Street', city: 'Cleveland', state: 'QLD', postalCode: '4163', phone: '(07) 3821 0155', email: 'Henry.Pike.MP@aph.gov.au' },
  { fullName: 'Tanya Plibersek', honorific: 'Hon', electorate: 'Sydney', roles: ['Minister for Social Services'], party: 'Australian Labor Party', address: '1a Great Buckingham Street', city: 'Redfern', state: 'NSW', postalCode: '2016', phone: '(02) 9379 0700', email: 'Tanya.Plibersek.MP@aph.gov.au' },
  { fullName: 'Melissa Price', honorific: 'Hon', electorate: 'Durack', roles: ['Deputy Chair of Joint Standing Committee on Northern Australia'], party: 'Liberal Party of Australia', address: '2B/209 Foreshore Drive', city: 'Geraldton', state: 'WA', postalCode: '6530', phone: '(08) 9964 2195', email: 'Melissa.Price.MP@aph.gov.au' },
  { fullName: 'Sam Rae', honorific: 'Hon', electorate: 'Hawke', roles: ['Minister for Aged Care and Seniors'], party: 'Australian Labor Party', address: '316 High Street', city: 'Melton', state: 'VIC', postalCode: '3337', phone: '(03) 9070 1960', email: 'Sam.Rae.MP@aph.gov.au' },
  { fullName: 'Leon Rebello', honorific: 'Mr', electorate: 'McPherson', roles: ['Deputy Chair of Joint Standing Committee on Migration'], party: 'Liberal National Party of Queensland', address: '47 Watts Drive', city: 'Varsity Lakes', state: 'QLD', postalCode: '4227', phone: '(07) 5580 9111', email: 'Leon.Rebello.MP@aph.gov.au' },
  { fullName: 'Gordon Reid', honorific: 'Dr', electorate: 'Robertson', roles: ['Member for Robertson'], party: 'Australian Labor Party', address: 'Suite 3.04 & 3.05, Level 3, 69 Central Coast Highway', city: 'West Gosford', state: 'NSW', postalCode: '2250', phone: '(02) 4322 2400', email: 'Gordon.Reid.MP@aph.gov.au' },
  { fullName: 'Dan Repacholi', honorific: 'Mr', electorate: 'Hunter', roles: ['Member for Hunter'], party: 'Australian Labor Party', address: '3 Edward Street', city: 'Cessnock', state: 'NSW', postalCode: '2325', phone: '(02) 4991 1022', email: 'Dan.Repacholi.MP@aph.gov.au' },
  { fullName: 'Amanda Rishworth', honorific: 'Hon', electorate: 'Kingston', roles: ['Minister for Employment and Workplace Relations'], party: 'Australian Labor Party', address: '232 Main South Road', city: 'Morphett Vale', state: 'SA', postalCode: '5162', phone: '(08) 8186 2588', email: 'Amanda.Rishworth.MP@aph.gov.au' },
  { fullName: 'Tracey Roberts', honorific: 'Ms', electorate: 'Pearce', roles: ['Member for Pearce'], party: 'Australian Labor Party', address: 'Unit 2, 23 Ocean Keys Boulevard', city: 'Clarkson', state: 'WA', postalCode: '6030', phone: '(08) 6500 6499', email: 'Tracey.Roberts.MP@aph.gov.au' },
  { fullName: 'Michelle Rowland', honorific: 'Hon', electorate: 'Greenway', roles: ['Attorney General'], party: 'Australian Labor Party', address: 'Suite 101C, 130 Main Street', city: 'Blacktown', state: 'NSW', postalCode: '2148', phone: '(02) 9671 4780', email: 'Michelle.Rowland.MP@aph.gov.au' },
  { fullName: 'Joanne Ryan', honorific: 'Ms', electorate: 'Lalor', roles: ['Chief Government Whip'], party: 'Australian Labor Party', address: 'Tenancies 3 & 4, 203-205 Watton Street', city: 'Werribee', state: 'VIC', postalCode: '3030', phone: '(03) 9742 5800', email: 'Joanne.Ryan.MP@aph.gov.au' },
  { fullName: 'Monique Ryan', honorific: 'Dr', electorate: 'Kooyong', roles: ['Deputy Chair of Standing Committee on Health, Aged Care and Disability'], party: 'Independent', address: '145 Camberwell Road', city: 'Hawthorn East', state: 'VIC', postalCode: '3123', phone: '(03) 9326 2900', email: 'Monique.Ryan.MP@aph.gov.au' },
  { fullName: 'Sophie Scamps', honorific: 'Dr', electorate: 'Mackellar', roles: ['Member for Mackellar'], party: 'Independent', address: 'Shop 1 & 2, 1238-1246 Pittwater Road', city: 'Narrabeen', state: 'NSW', postalCode: '2101', phone: '(02) 9913 9566', email: 'Sophie.Scamps.MP@aph.gov.au' },
  { fullName: 'Marion Scrymgour', honorific: 'Ms', electorate: 'Lingiari', roles: ['Chair of Joint Standing Committee on Northern Australia'], party: 'Australian Labor Party', address: '79 Todd Mall', city: 'Alice Springs', state: 'NT', postalCode: '0870', phone: '(08) 8952 9696', email: 'Marion.Scrymgour.MP@aph.gov.au' },
  { fullName: 'Rebekha Sharkie', honorific: 'Ms', electorate: 'Mayo', roles: ['Member for Mayo'], party: 'Centre Alliance', address: 'Shop 3, Barker Plaza Shopping Centre, 22-28 Hutchinson Street', city: 'Mt Barker', state: 'SA', postalCode: '5251', phone: '', email: 'Rebekha.Sharkie.MP@aph.gov.au' },
  { fullName: 'Sally Sitou', honorific: 'Ms', electorate: 'Reid', roles: ['Member for Reid'], party: 'Australian Labor Party', address: '72 Burwood Road', city: 'Burwood', state: 'NSW', postalCode: '2134', phone: '(02) 9715 7444', email: 'Sally.Sitou.MP@aph.gov.au' },
  { fullName: 'Ben Small', honorific: 'Mr', electorate: 'Forrest', roles: ['Deputy Chair of Standing Committee on Procedure'], party: 'Liberal Party of Australia', address: 'Units 7 & 8 Grand Cinema Complex, Cnr Victoria and Clifton Streets', city: 'Bunbury', state: 'WA', postalCode: '6231', phone: '(08) 9721 3788', email: 'Ben.Small.MP@aph.gov.au' },
  { fullName: 'David Smith', honorific: 'Mr', electorate: 'Bean', roles: ['Government Whip'], party: 'Australian Labor Party', address: '205 Anketell Street', city: 'Tuggeranong', state: 'ACT', postalCode: '2900', phone: '(02) 6293 1344', email: 'David.Smith.MP@aph.gov.au' },
  { fullName: 'Matt Smith', honorific: 'Mr', electorate: 'Leichhardt', roles: ['Member for Leichhardt'], party: 'Australian Labor Party', address: 'Suite 3 & 4, 200 Mulgrave Road', city: 'Cairns', state: 'QLD', postalCode: '4870', phone: '(07) 4051 2220', email: 'Matt.Smith.MP@aph.gov.au' },
  { fullName: 'Zhi Soon', honorific: 'Mr', electorate: 'Banks', roles: ['Member for Banks'], party: 'Australian Labor Party', address: '22 Revesby Place', city: 'Revesby', state: 'NSW', postalCode: '2212', phone: '(02) 9353 0588', email: 'Zhi.Soon.MP@aph.gov.au' },
  { fullName: 'Allegra Spender', honorific: 'Ms', electorate: 'Wentworth', roles: ['Member for Wentworth'], party: 'Independent', address: 'Suite 302, Level 3, 179-191 New South Head Road', city: 'Edgecliff', state: 'NSW', postalCode: '2027', phone: '', email: 'Allegra.Spender.MP@aph.gov.au' },
  { fullName: 'Anne Stanley', honorific: 'Ms', electorate: 'Werriwa', roles: ['Government Whip'], party: 'Australian Labor Party', address: 'Shop 7, 441 Hoxton Park Road', city: 'Hinchinbrook', state: 'NSW', postalCode: '2168', phone: '(02) 8783 0977', email: 'Anne.Stanley.MP@aph.gov.au' },
  { fullName: 'Zali Steggall', honorific: 'Ms', electorate: 'Warringah', roles: ['Deputy Chair of Standing Committee on Climate Change, Energy, Environment and Water'], party: 'Independent', address: 'Units 4-6, 8-28 The Corso', city: 'Manly', state: 'NSW', postalCode: '2095', phone: '(02) 9977 6411', email: 'Zali.Steggall.MP@aph.gov.au' },
  { fullName: 'Meryl Swanson', honorific: 'Ms', electorate: 'Paterson', roles: ['Chair of Standing Committee on Primary Industries'], party: 'Australian Labor Party', address: '35 Sturgeon Street', city: 'Raymond Terrace', state: 'NSW', postalCode: '2324', phone: '(02) 4983 2401', email: 'Meryl.Swanson.MP@aph.gov.au' },
  { fullName: 'Angus Taylor', honorific: 'Hon', electorate: 'Hume', roles: ['Leader of the Opposition'], party: 'Liberal Party of Australia', address: '18 Hill Street', city: 'Camden', state: 'NSW', postalCode: '2570', phone: '(02) 4658 7188', email: 'Angus.Taylor.MP@aph.gov.au' },
  { fullName: 'Jess Teesdale', honorific: 'Ms', electorate: 'Bass', roles: ['Member for Bass'], party: 'Australian Labor Party', address: '98-102 St John Street', city: 'Launceston', state: 'TAS', postalCode: '7250', phone: '(03) 6334 7033', email: 'Jess.Teesdale.MP@aph.gov.au' },
  { fullName: 'Dan Tehan', honorific: 'Hon', electorate: 'Wannon', roles: ['Manager of Opposition Business'], party: 'Liberal Party of Australia', address: '150 Gray Street', city: 'Hamilton', state: 'VIC', postalCode: '3300', phone: '(03) 5572 1100', email: 'Dan.Tehan.MP@aph.gov.au' },
  { fullName: 'Susan Templeman', honorific: 'Ms', electorate: 'Macquarie', roles: ['Chair of Standing Committee on Communications, the Arts and Sport'], party: 'Australian Labor Party', address: 'Ground Floor, 299 George Street', city: 'Windsor', state: 'NSW', postalCode: '2756', phone: '(02) 4573 8222', email: 'Susan.Templeman.MP@aph.gov.au' },
  { fullName: 'Matt Thistlethwaite', honorific: 'Hon', electorate: 'Kingsford Smith', roles: ['Assistant Minister for Immigration', 'Assistant Minister for Foreign Affairs and Trade'], party: 'Australian Labor Party', address: 'Shop 6, 205 Maroubra Road', city: 'Maroubra', state: 'NSW', postalCode: '2035', phone: '(02) 9349 6007', email: 'Matt.Thistlethwaite.MP@aph.gov.au' },
  { fullName: 'Phillip Thompson', honorific: 'Mr', electorate: 'Herbert', roles: ['Deputy Chair of Parliamentary Joint Committee on Intelligence and Security'], party: 'Liberal National Party of Queensland', address: 'G06 Nathan Business Centre, 340 Ross River Road', city: 'Cranbrook', state: 'QLD', postalCode: '4814', phone: '(07) 4725 2066', email: 'Phillip.Thompson.MP@aph.gov.au' },
  { fullName: 'Kate Thwaites', honorific: 'Hon', electorate: 'Jagajaga', roles: ['Chair of Parliamentary Joint Committee on the National Anti-Corruption Commission'], party: 'Australian Labor Party', address: '2/37 Burgundy Street', city: 'Heidelberg', state: 'VIC', postalCode: '3084', phone: '(03) 9459 1411', email: 'Kate.Thwaites.MP@aph.gov.au' },
  { fullName: 'Anne Urquhart', honorific: 'Ms', electorate: 'Braddon', roles: ['Chair of Standing Committee on Climate Change, Energy, Environment and Water'], party: 'Australian Labor Party', address: 'Shop 9, 22 Wilmot Street', city: 'Burnie', state: 'TAS', postalCode: '7320', phone: '(03) 6431 1333', email: 'Anne.Urquhart.MP@aph.gov.au' },
  { fullName: 'Tom Venning', honorific: 'Mr', electorate: 'Grey', roles: ['Deputy Chair of Joint Standing Committee on Aboriginal and Torres Strait Islander Affairs'], party: 'Liberal Party of Australia', address: '43 Taylor Street', city: 'Kadina', state: 'SA', postalCode: '5554', phone: '(08) 8821 4366', email: 'Tom.Venning.MP@aph.gov.au' },
  { fullName: 'Aaron Violi', honorific: 'Mr', electorate: 'Casey', roles: ['Member for Casey'], party: 'Liberal Party of Australia', address: '110-112 Main Street', city: 'Lilydale', state: 'VIC', postalCode: '3140', phone: '(03) 9727 0799', email: 'Aaron.Violi.MP@aph.gov.au' },
  { fullName: 'Andrew Wallace', honorific: 'Mr', electorate: 'Fisher', roles: ['Member for Fisher'], party: 'Liberal National Party of Queensland', address: 'The Edge – Upper Level East, Unit 11, 10 Lake Kawana Boulevard', city: 'Bokarina', state: 'QLD', postalCode: '4575', phone: '(07) 5493 5556', email: 'Andrew.Wallace.MP@aph.gov.au' },
  { fullName: 'Elizabeth Watson-Brown', honorific: 'Ms', electorate: 'Ryan', roles: ['Member for Ryan'], party: 'Australian Greens', address: '188 Moggill Road', city: 'Taringa', state: 'QLD', postalCode: '4068', phone: '(07) 3378 1599', email: 'Elizabeth.Watson-Brown.MP@aph.gov.au' },
  { fullName: 'Tim Watts', honorific: 'Hon', electorate: 'Gellibrand', roles: ['Chair of Standing Committee on Education'], party: 'Australian Labor Party', address: 'Ground Floor Units 2 & 3, 455 Melbourne Road', city: 'Newport', state: 'VIC', postalCode: '3015', phone: '(03) 9687 7661', email: 'Tim.Watts.MP@aph.gov.au' },
  { fullName: 'Anne Webster', honorific: 'Dr', electorate: 'Mallee', roles: ['Member for Mallee'], party: 'The Nationals', address: 'Ground Floor, 148 Eighth Street', city: 'Mildura', state: 'VIC', postalCode: '3500', phone: '(03) 5021 5987', email: 'Anne.Webster.MP@aph.gov.au' },
  { fullName: 'Anika Wells', honorific: 'Hon', electorate: 'Lilley', roles: ['Minister for Communications', 'Minister for Sport'], party: 'Australian Labor Party', address: 'Ground Floor, 1176 Sandgate Road', city: 'Nundah', state: 'QLD', postalCode: '4012', phone: '(07) 3266 8244', email: 'Anika.Wells.MP@aph.gov.au' },
  { fullName: 'Rebecca White', honorific: 'Hon', electorate: 'Lyons', roles: ['Assistant Minister for Women', 'Assistant Minister for Health and Aged Care'], party: 'Australian Labor Party', address: 'Suite 105, Green Point Plaza, 28 Green Point Road', city: 'Bridgewater', state: 'TAS', postalCode: '7030', phone: '(03) 6263 3721', email: 'Rebecca.White.MP@aph.gov.au' },
  { fullName: 'Andrew Wilkie', honorific: 'Mr', electorate: 'Clark', roles: ['Member for Clark'], party: 'Independent', address: '188 Collins Street', city: 'Hobart', state: 'TAS', postalCode: '7001', phone: '(03) 6234 5255', email: 'Andrew.Wilkie.MP@aph.gov.au' },
  { fullName: 'Andrew Willcox', honorific: 'Mr', electorate: 'Dawson', roles: ['Deputy Chair of Parliamentary Standing Committee on Public Works'], party: 'Liberal National Party of Queensland', address: 'Level 2, 47 Gordon Street', city: 'Mackay', state: 'QLD', postalCode: '4740', phone: '(07) 4944 0662', email: 'Andrew.Willcox.MP@aph.gov.au' },
  { fullName: 'Josh Wilson', honorific: 'Hon', electorate: 'Fremantle', roles: ['Assistant Minister for Climate Change and Energy'], party: 'Australian Labor Party', address: 'Office 12, Level 1, 135 High Street Mall', city: 'Fremantle', state: 'WA', postalCode: '6160', phone: '(08) 9335 8555', email: 'Josh.Wilson.MP@aph.gov.au' },
  { fullName: 'Rick Wilson', honorific: 'Mr', electorate: "O'Connor", roles: ['Deputy Chair of Joint Standing Committee on Trade and Investment Growth'], party: 'Liberal Party of Australia', address: '345 Hannan Street', city: 'Kalgoorlie', state: 'WA', postalCode: '6430', phone: '(08) 9021 2044', email: 'Rick.Wilson.MP@aph.gov.au' },
  { fullName: 'Tim Wilson', honorific: 'Hon', electorate: 'Goldstein', roles: ['Member for Goldstein'], party: 'Liberal Party of Australia', address: '677 Nepean Highway', city: 'Brighton East', state: 'VIC', postalCode: '3187', phone: '(03) 9557 4644', email: 'Tim.Wison.MP@aph.gov.au' },
  { fullName: 'Sarah Witty', honorific: 'Ms', electorate: 'Melbourne', roles: ['Member for Melbourne'], party: 'Australian Labor Party', address: '142 Johnston Street', city: 'Fitzroy', state: 'VIC', postalCode: '3065', phone: '(03) 7066 6595', email: 'Sarah.Witty.MP@aph.gov.au' },
  { fullName: 'Jason Wood', honorific: 'Hon', electorate: 'La Trobe', roles: ['Deputy Chair of Parliamentary Joint Committee on Human Rights'], party: 'Liberal Party of Australia', address: 'Unit 3, 16 Langmore Lane', city: 'Berwick', state: 'VIC', postalCode: '3806', phone: '(03) 9768 9164', email: 'Jason.Wood.MP@aph.gov.au' },
  { fullName: 'Terry Young', honorific: 'Mr', electorate: 'Longman', roles: ['Second Deputy Speaker'], party: 'Liberal National Party of Queensland', address: 'Level 1 - Unit A, 69 King Street', city: 'Caboolture', state: 'QLD', postalCode: '4510', phone: '(07) 5432 3177', email: 'Terry.Young.MP@aph.gov.au' },
  { fullName: 'Tony Zappia', honorific: 'Mr', electorate: 'Makin', roles: ['Chair of Parliamentary Standing Committee on Public Works'], party: 'Australian Labor Party', address: '959 North East Road', city: 'Modbury', state: 'SA', postalCode: '5092', phone: '(08) 8265 3100', email: 'Tony.Zappia.MP@aph.gov.au' },
];

function slugify(name: string): string {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

function normalizePhone(phone: string): string {
  return phone.replace(/[\s()-]/g, '').replace(/^0/, '+61');
}

async function main() {
  const url = new URL(connectionString);
  const pool = new pg.Pool({
    host: url.hostname,
    port: parseInt(url.port),
    database: url.pathname.slice(1),
    user: url.username,
    password: decodeURIComponent(url.password),
    ssl: { rejectUnauthorized: false },
  });

  const client = await pool.connect();

  try {
    await client.query('BEGIN');

    // 1. Create "House of Representatives" department if missing
    const deptCheck = await client.query(
      `SELECT id FROM departments WHERE id = $1`,
      [AU_HOUSE_DEPT_ID]
    );

    if (deptCheck.rowCount === 0) {
      console.log('Creating department: House of Representatives');
      await client.query(
        `INSERT INTO departments (id, name, code, description, "organisationId", "parentId", "isActive", portfolio, "createdAt", "updatedAt")
         VALUES ($1, $2, $3, $4, $5, NULL, true, 'other', $6, $6)`,
        [AU_HOUSE_DEPT_ID, 'House of Representatives', 'au-house-reps', 'Members of the Australian House of Representatives', AU_ORG_ID, NOW]
      );
    }

    // 2. Insert MPs (skip existing)
    let inserted = 0;
    let skipped = 0;

    for (const mp of mps) {
      // Skip already-in-DB ministers
      if (EXISTING_CONTACTS.has(mp.fullName)) {
        console.log(`  SKIP (exists in DB): ${mp.fullName}`);
        skipped++;
        continue;
      }

      const contactId = `au-ct-${slugify(mp.fullName)}`;
      const channelEmailId = `au-ch-${slugify(mp.fullName)}-email`;
      const channelPhoneId = `au-ch-${slugify(mp.fullName)}-phone`;
      const channelAddrId = `au-ch-${slugify(mp.fullName)}-addr`;

      // Build role title: first role if minister, otherwise "Member for X"
      const roleTitle = mp.roles[0] || `Member for ${mp.electorate}`;

      // Check if already inserted
      const exists = await client.query(
        `SELECT id FROM contacts WHERE id = $1`,
        [contactId]
      );
      if (exists.rowCount && exists.rowCount > 0) {
        console.log(`  SKIP (already seeded): ${mp.fullName}`);
        skipped++;
        continue;
      }

      // Insert contact
      await client.query(
        `INSERT INTO contacts (id, "fullName", "roleTitle", "departmentId", "organisationId", "primaryLocationId", "ownerId", "isHeadOfficeBased", "isActive", "createdAt", "updatedAt")
         VALUES ($1, $2, $3, $4, $5, NULL, NULL, false, true, $6, $6)`,
        [contactId, mp.fullName, roleTitle, AU_HOUSE_DEPT_ID, AU_ORG_ID, NOW]
      );

      // Insert email channel
      await client.query(
        `INSERT INTO contact_channels (id, "contactId", "channelType", value, "displayValue", "phoneNormalized", "addressLine1", city, state, "postalCode", country, "createdAt", "updatedAt")
         VALUES ($1, $2, 'email', $3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, $4, $4)`,
        [channelEmailId, contactId, mp.email, NOW]
      );

      // Insert phone channel (if available)
      if (mp.phone) {
        await client.query(
          `INSERT INTO contact_channels (id, "contactId", "channelType", value, "displayValue", "phoneNormalized", "addressLine1", city, state, "postalCode", country, "createdAt", "updatedAt")
           VALUES ($1, $2, 'phone', $3, NULL, $4, NULL, NULL, NULL, NULL, NULL, $5, $5)`,
          [channelPhoneId, contactId, mp.phone, normalizePhone(mp.phone), NOW]
        );
      }

      // Insert address channel
      await client.query(
        `INSERT INTO contact_channels (id, "contactId", "channelType", value, "displayValue", "phoneNormalized", "addressLine1", city, state, "postalCode", country, "createdAt", "updatedAt")
         VALUES ($1, $2, 'office_address', $3, NULL, NULL, $4, $5, $6, $7, 'Australia', $8, $8)`,
        [channelAddrId, contactId, `${mp.address}, ${mp.city} ${mp.state} ${mp.postalCode}`, mp.address, mp.city, mp.state, mp.postalCode, NOW]
      );

      console.log(`  INSERTED: ${mp.fullName} (${mp.party.split(' ')[0]}) - ${mp.electorate}`);
      inserted++;
    }

    await client.query('COMMIT');
    console.log(`\nAU MPs: ${inserted} inserted, ${skipped} skipped (of ${mps.length} total)`);
    console.log('AU seed complete!');
  } catch (e) {
    await client.query('ROLLBACK');
    console.error('Error:', e);
    throw e;
  } finally {
    client.release();
    await pool.end();
  }
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
