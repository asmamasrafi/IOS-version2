
import UIKit

class Continent {
    let name: String
    let countries: [String]
    var isOpened: Bool = false
    
    init(name: String, countries: [String], isOpened: Bool = false) {
        self.name = name
        self.countries = countries
        self.isOpened = isOpened
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var continents = [Continent]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupData()
        setupTableView()
    }
    
    func setupData() {
        continents = [
            Continent(name: "Africa", countries: ["Maroc", "Tunis", "Algeria"]),
            Continent(name: "Asia", countries: ["China", "Jordan", "Iran"]),
            Continent(name: "Europe", countries: ["Spain", "France", "Portugal"]),
        ]
    }
    
    let countryDescriptions: [String: String] = [
        "Maroc": "Le Maroc est un pays situé en Afrique du Nord, bordé par l'océan Atlantique à l'ouest et la mer Méditerranée au nord. Il est connu pour sa diversité culturelle, alliant des influences arabes, berbères et africaines. Marrakech, Casablanca et Fès sont parmi ses villes les plus célèbres, avec des marchés animés, des médinas historiques et des palais somptueux.",
        
        "Tunis": "La Tunisie est également un pays d'Afrique du Nord, situé entre l'Algérie à l'ouest et la Libye à l'est, avec la mer Méditerranée au nord. Elle est réputée pour ses plages méditerranéennes, ses sites archéologiques romains tels que Carthage, et ses villes historiques comme Tunis, la capitale, et Sousse.",
        
         "Algeria": "L'Algérie est le plus grand pays d'Afrique et du monde arabe, situé au nord-ouest de l'Afrique. Elle partage ses frontières avec la Tunisie, la Libye, le Niger, le Mali, la Mauritanie, le Sahara occidental, le Maroc et la mer Méditerranée. Alger en est la capitale, et le pays est riche en histoire, en culture berbère et arabe, ainsi qu'en paysages désertiques impressionnants.",
         
          "China": "La Chine est le pays le plus peuplé du monde, situé en Asie de l'Est. Elle est connue pour sa riche histoire, sa culture ancienne, ses mégalopoles modernes et ses paysages naturels variés.Pékin, Shanghai et Hong Kong sont parmi ses villes les plus célèbres, tandis que la Grande Muraille, la Cité interdite et les guerriers en terre cuite de Xi'an sont parmi ses attractions historiques les plus emblématiques.",
          
           "Jordan": "La Jordanie est un pays du Moyen-Orient, connu pour ses paysages désertiques, ses sites historiques et sa richesse culturelle. Petra, une ancienne ville creusée dans la roche, est l'une de ses attractions les plus célèbres, tandis que la mer Morte, le Wadi Rum et les ruines romaines de Jerash attirent également de nombreux visiteurs..",

 "Iran": "L'Iran, également connu sous le nom de Perse dans l'histoire, est situé au Moyen-Orient. Téhéran en est la capitale, et le pays est connu pour ses sites historiques impressionnants, sa culture riche et sa cuisine délicieuse. Ispahan, Persépolis et Shiraz sont parmi ses destinations les plus populaires, offrant une combinaison de beauté naturelle et de trésors architecturaux",

 "Spain": "La Tunisie est également un pays d'Afrique du Nord, situé entre l'Algérie à l'ouest et la Libye à l'est, avec la mer Méditerranée au nord. Elle est réputée pour ses plages méditerranéennes, ses sites archéologiques romains tels que Carthage, et ses villes historiques comme Tunis, la capitale, et Sousse.",
    ]

    let countryCapitals: [String: String] = [
        "Maroc": "Rabat",
        "Tunis": "Tunis",
        "Algeria": "Alger",
        "China": "Pékin",
        "Jordan": "Amman",
        "Iran": "Téhéran",
        "Spain": "Madrid",
        "France": "Paris",
        "Portugal": "Lisbonne",
        // Ajoutez les autres pays avec leurs capitales ici
    ]


    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    // UITableViewDataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return continents.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = continents[section]
        return section.isOpened ? section.countries.count + 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = continents[indexPath.section].name
            cell.textLabel?.textColor = .systemBlue
            cell.backgroundColor = .clear
            cell.accessoryType = .disclosureIndicator
        } else {
            cell.textLabel?.text = continents[indexPath.section].countries[indexPath.row - 1]
            cell.textLabel?.textColor = .systemRed
            cell.backgroundColor = .clear
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            continents[indexPath.section].isOpened = !continents[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        } else {
            let country = continents[indexPath.section].countries[indexPath.row - 1]
            let description = countryDescriptions[country] ?? "Description non disponible"
            let capital = countryCapitals[country] ?? "Capitale non disponible"
            
            let countryDetailsVC = CountryDetailsViewController()
            countryDetailsVC.countryName = country
            countryDetailsVC.countryDescription = description
            countryDetailsVC.countryCapital = capital
            navigationController?.pushViewController(countryDetailsVC, animated: true)
        }
    }
}
