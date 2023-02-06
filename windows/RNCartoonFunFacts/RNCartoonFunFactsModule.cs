using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Cartoon.Fun.Facts.RNCartoonFunFacts
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNCartoonFunFactsModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNCartoonFunFactsModule"/>.
        /// </summary>
        internal RNCartoonFunFactsModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNCartoonFunFacts";
            }
        }
    }
}
