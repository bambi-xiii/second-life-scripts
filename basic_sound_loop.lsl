// =============================================================================
// LESSON 1: Basic Soundloop Script with Touch Control
// Learn LSL fundamentals through audio programming
// =============================================================================
//
// WHAT THIS SCRIPT TEACHES:
// • Script structure and the default state
// • Event handling: state_entry() and touch_start()
// • Variables and data types (integer for tracking state)
// • Audio functions: llSetSoundRadius(), llLoopSound(), llStopSound()
// • Conditional logic with if/else statements
// • Working with UUIDs (asset identifiers)
// • User feedback with llSay() and llOwnerSay()
//
// SCRIPT STRUCTURE EXPLAINED:
// default { }          - Every script has at least one state (default)
// integer variable     - Stores numbers (whole numbers only)
// state_entry() { }    - Event that fires when the script starts/resets
// touch_start() { }    - Event that fires when someone touches the object
// llSetSoundRadius()   - Sets how far the sound can be heard (meters)
// llLoopSound()        - Plays a sound continuously on repeat
// llStopSound()        - Stops all sounds from this object
// llSay()             - Sends message to nearby chat (public)
// llOwnerSay()        - Sends message only to the object owner
//
// EXPERIMENT AND LEARN:
// Try modifying these values to see what happens:
// • Sound radius: Try 0.5, 5.0, 20.0 (20m is maximum)
// • Volume: Try 0.1 (quiet), 0.5 (medium), 1.0 (maximum)
// • Chat channel: Change 0 to another number for private channels
// • Replace the UUID with your own uploaded sound file
//
// LEARNING QUESTIONS:
// • What happens when you change the sound radius?
// • How does the touch interaction work?
// • What's the difference between llSay() and llOwnerSay()?
// • Can you add more touch responses or different sounds?
//
// CHALLENGE EXERCISES:
// 1. Add a timer that automatically stops the sound after 30 seconds
// 2. Make the object change color when sound is playing vs stopped
// 3. Add a second touch that changes the volume instead of stopping
// 4. Create a rotation effect that spins the object while sound plays
//
// =============================================================================

// Global variables (accessible throughout the script)
integer soundPlaying = FALSE;  // Track whether sound is currently playing
string soundUUID = "646b2040-5b22-8e49-a0b8-7d597b6bf5df";  // Sound file UUID
float soundVolume = 1.0;       // Volume level (0.0 to 1.0)
float soundRadius = 5.0;       // How far sound travels (0.0 to 20.0 meters)

default
{
    state_entry()
    {
        // This event runs when the script starts or resets
        llOwnerSay("Soundloop script ready! Touch the object to start/stop sound.");
        
        // Set the sound radius (how far it can be heard in meters)
        // Range: 0.0 to 20.0 meters
        llSetSoundRadius(soundRadius);
        
        // Set initial state
        soundPlaying = FALSE;
        
        // Give user feedback about the setup
        llOwnerSay("Sound radius set to " + (string)soundRadius + " meters.");
        llOwnerSay("Volume set to " + (string)soundVolume + " (max is 1.0).");
    }
    
    touch_start(integer total_number)
    {
        // This event runs when someone touches the object
        // total_number = how many people touched it simultaneously
        
        string toucher = llDetectedName(0);  // Get name of person who touched
        
        if (soundPlaying)
        {
            // Sound is currently playing, so stop it
            llStopSound();
            soundPlaying = FALSE;
            
            // Give feedback to everyone nearby and the owner
            llSay(0, "Sound stopped by " + toucher);
            llOwnerSay("Sound stopped. Touch again to restart.");
        }
        else
        {
            // Sound is not playing, so start it
            llLoopSound(soundUUID, soundVolume);
            soundPlaying = TRUE;
            
            // Give feedback to everyone nearby and the owner
            llSay(0, "Sound started by " + toucher);
            llOwnerSay("Sound playing. Touch again to stop.");
        }
        
        // LEARNING NOTE: This if/else structure is fundamental in programming!
        // It allows the script to do different things based on current conditions.
    }
    
    // BONUS: This event runs when the script is removed or object is deleted
    on_rez(integer start_param)
    {
        // Reset the script when the object is rezzed (placed in world)
        llResetScript();
    }
}

// =============================================================================
// NEXT STEPS FOR LEARNING:
// 
// After mastering this script, you'll be ready to learn:
// • Timers and scheduled events
// • More complex user interfaces
// • Data storage and memory management  
// • Communication between objects
// • Advanced audio effects and controls
//
// Remember: The best way to learn LSL is by experimenting!
// Change values, add new features, and see what happens.
// =============================================================================
