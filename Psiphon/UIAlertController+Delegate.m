/*
 * Copyright (c) 2017, Psiphon Inc.
 * All rights reserved.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#import "UIAlertController+Delegate.h"

@implementation UIAlertController (Delegate)

+ (void)presentSimpleAlertWithTitle:(NSString *_Nonnull)title message:(NSString *_Nonnull)message preferredStyle:(UIAlertControllerStyle)preferredStyle okHandler:(void (^ _Nullable)(UIAlertAction *action))okHandler {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedStringWithDefaultValue(@"OK_BUTTON", nil, [NSBundle mainBundle], @"OK", @"Alert OK Button") style:UIAlertActionStyleDefault handler:okHandler];
    [ac addAction:okAction];
    [ac presentFromTopController];
}

+ (UIViewController *)getTopMostViewController {
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while(topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}

/**
 * Presents this instance from application's key window top most view controller.
 */
- (void)presentFromTopController {
    [[UIAlertController getTopMostViewController] presentViewController:self animated:TRUE completion:nil];
}

@end
