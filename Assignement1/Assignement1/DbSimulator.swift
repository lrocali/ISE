//
//  DBSimulator.swift
//  Assignement1
//
//  Created by Mateus Cirolini on 29/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation

class DBSimulator {
    var allCinemas:[String] = []
    var allMoviesName:[String] = []
    var allMoviesGenre:[String] = []
    var allMoviesSynopsis:[String] = []
    
    init() {
        allCinemas = ["Cineplex Australia","Dendy Cinemas" ,"Event Cinemas","Howard Cinemas","Hoyts","Independent Exhibitors","Palace Cinemas","The Movie Masters","Reading Cinemas","Victa Cinemas","Wallis"]
        
        allMoviesName = [
            "A Little Chaos",
            "American Snipper",
            "Annie",
            "Avengers: Age Of Ultron",
            "Big Eyes",
            "Big Hero 6",
            "Birdman",
            "Chappie",
            "Crazy Beautiful You",
            "Fast & Furious 7",
            "Fifty Shades Of Grey",
            "Focus",
            "Get Hard",
            "Home"]
        
        allMoviesGenre = [
            "Comedy, Drama",
            "Action",
            "Family,Musical",
            "Action, Adventure",
            "Biography, Drama",
            "Animation, Action",
            "Drama",
            "Action, Sci-Fi",
            "Foreign, Romance",
            "Action, Crime",
            "Romance, Drama",
            "Comedy, Crime",
            "Comedy",
            "Family, Animation"]
        
        allMoviesSynopsis = [
            "A female landscape-gardener is awarded the esteemed assignment to construct the grand gardens at Versaillers, a gilt-edged position which thrusts her to the very centre of the court of King Louis XIV.",
            "A Navy SEAL recounts his military career, which includes more than 150 confirmed kills",
            "Business tycoon and mayoral candidate Benjamin Stacks launches a campaign to take in Annie, a young girl who has been living with her mean foster mom Miss Hannigan since her parents left her as a baby.",
            "When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and it is up to the Avengers to stop the villainous Ultron from enacting his terrible plans.",
            "A drama centered on the awakening of the painter Margaret Keane, her phenomenal success in the 1950s, and the subsequent legal difficulties she had with her husband, who claimed credit for her works in the 1960s",
            "The special bond that develops between plus-sized inflatable robot Baymax, and prodigy Hiro Hamada, who team up with a group of friends to form a band of high-tech heroes",
            "A washed-up actor who once played an iconic superhero must overcome his ego and family trouble as he mounts a Broadway play in a bid to reclaim his past glory.",
            "After being kidnapped by two criminals during birth, Chappie becomes the adopted son in a strange and dysfunctional family. Chappie is preternaturally gifted, one of a kind, a prodigy. He also happens to be a robot.",
            "Filipino: A spoiled young girl is forced to tag along with her mom on a medical mission in Tarlac. There she meets a young man from a different world who shows her another side of life.",
            "Ian Shaw seeks revenge against Dominic Toretto and his crew for the death of his brother.",
            "Literature student Anastasia Steele's life changes forever when she meets handsome, yet tormented, billionaire Christian Grey.",
            "A veteran grifter takes a young, attractive woman under his wing, but things get complicated when they become romantically involved.",
            "When millionaire hedge fund manager James (Will Ferrell) is nailed for fraud and bound for a stretch in San Quentin, the judge gives him 30 days to get his affairs in order. ",
            "When Oh, a loveable misfit from another planet, lands on Earth and finds himself on the run from his own people, he forms an unlikely friendship with an adventurous girl named Tip who is on a quest of her own."
            ]
    }
}