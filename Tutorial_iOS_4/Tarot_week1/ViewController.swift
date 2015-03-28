
import UIKit

class ViewController: UIViewController
{
    
    
    // Property referencing the model for managing data and business logic
    
    var model = Model.sharedInstance
    var showingBack = false
    var front:UIImageView!
    var back:UIImageView!
    var cardView: UIView!
    var direction: UIViewAnimationOptions = UIViewAnimationOptions.TransitionFlipFromLeft
    var gesturesRegistered: Bool = false
    
    
    @IBOutlet weak var lblAnswers: UILabel!
    @IBOutlet weak var cardPlaceholder_HolderUIView: UIView!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var fadedImageBackground: UIImageView!
    @IBOutlet weak var labelTransparentOverlay: UILabel!
    
    // Respond to the user clicking a button by providing advice from the oracle
    @IBAction func askTheOracle(sender: UIButton)
    {
        // Retrieve a random message from the oracle
        lblAnswers.text = model.respond()
        
        // Change the image in the UIImageView to the currently selected card
        cardImageView.image = UIImage(named:model.currentCard.imageName)
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer)
    {
        if (sender.direction == .Left)
        {
            direction = UIViewAnimationOptions.TransitionFlipFromRight
        }
        if (sender.direction == .Right)
        {
            direction = UIViewAnimationOptions.TransitionFlipFromLeft
        }
        showCard(direction)
    }
    
    
    private func showCard(direction: UIViewAnimationOptions)
    {
        if (showingBack)
        {
            UIView.transitionFromView(front, toView: back, duration: 1, options:
                direction, completion: nil)
            showingBack = false
            
            // Change the image in the UIImageView to the currently selected card
            cardImageView.image = UIImage(named:model.currentCard.imageName)
            cardImageView.hidden = false
            lblText.hidden = true
            fadedImageBackground.hidden = true
            button.hidden = false
            labelTransparentOverlay.hidden = true
        }
        
        else
        {
            UIView.transitionFromView(back, toView: front, duration: 1, options:
                direction, completion: nil)
            showingBack = true
            lblText.text = model.description()
            cardImageView.hidden = true
            lblText.hidden = false
            labelTransparentOverlay.hidden = false
            fadedImageBackground.hidden = false
            button.hidden = true
            
            fadedImageBackground.image = UIImage(named: "Background.png")
        }
    }
    
    
    
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        // Hide controls on back of card
        labelTransparentOverlay.hidden = true
        lblText.hidden = true
        fadedImageBackground.hidden = true
        
        if(!gesturesRegistered)
        {
            gesturesRegistered = true
            
            // Set up flipping behaviour (These controls are just dummy controls used to
            // support the flipping behaviour).
            front = UIImageView(image: UIImage(named: "Fool.jpg"))
            back = UIImageView(image: UIImage(named: "Fool.jpg"))
            cardPlaceholder_HolderUIView.addSubview(back)
            back.hidden = true
            front.hidden = true
            
            // Add Swipe Gesture to the placeholder for the card
            let swipeLeft = UISwipeGestureRecognizer(target: self, action:
                Selector("handleSwipes:"))
            swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
            let swipeRight = UISwipeGestureRecognizer(target: self, action:
                Selector("handleSwipes:"))
            swipeRight.direction = UISwipeGestureRecognizerDirection.Right
            
            // We add two gestures here so the user can swipe right or left
            cardPlaceholder_HolderUIView.addGestureRecognizer(swipeLeft)
            cardPlaceholder_HolderUIView.addGestureRecognizer(swipeRight)
        
            super.viewDidLoad()
        }
        
    }// Lifecycle method for clearing up memory resources
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}