// Unicode Suppressor
// (C) 2015 Mohammad Abu-Garbeyyeh
//
// Licensed under GPLv3

static NSString* fixString(NSString *orig) {
     if ([orig containsString:@"لُلُصّبُلُلصّبُررً"] || [orig containsString:@"冗"] || [orig containsString:@" ॣ"]) {
         return @"Malicious text removed";
     }
     
     return orig;
}

%hook BBBulletin

-(id)message {
    return fixString(%orig);
}

%end

%hook CKConversation

-(id)previewText {
    return fixString(%orig);
}

%end

// Uncomment the following lines to extend the fix everywhere. May cause a performance hit!!!
// Add com.apple.UIKit to the hooked bundles
/*
%hook UILabel

-(void)setText:(NSString*)text {
    %orig(fixString(text));
}

%end
 */