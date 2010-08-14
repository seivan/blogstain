//
//  admin_posts.mm
//
//  Created by Seivan Heidari on 2010-08-14.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "admin_posts.h"

static admin_posts* SharedInstance;

@implementation admin_posts
+ (admin_posts*)sharedInstance
{
	return SharedInstance ?: [[self new] autorelease];
}

- (id)init
{
	if(SharedInstance)
	{
		[self release];
	}
	else if(self = SharedInstance = [[super init] retain])
	{
		/* init code */
	}
	return SharedInstance;
}
@end
