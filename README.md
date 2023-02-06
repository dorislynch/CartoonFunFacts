
# react-native-cartoon-fun-facts

## Getting started

`$ npm install react-native-cartoon-fun-facts --save`

### Mostly automatic installation

`$ react-native link react-native-cartoon-fun-facts`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-cartoon-fun-facts` and add `RNCartoonFunFacts.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCartoonFunFacts.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNCartoonFunFactsPackage;` to the imports at the top of the file
  - Add `new RNCartoonFunFactsPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-cartoon-fun-facts'
  	project(':react-native-cartoon-fun-facts').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-cartoon-fun-facts/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-cartoon-fun-facts')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNCartoonFunFacts.sln` in `node_modules/react-native-cartoon-fun-facts/windows/RNCartoonFunFacts.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Cartoon.Fun.Facts.RNCartoonFunFacts;` to the usings at the top of the file
  - Add `new RNCartoonFunFactsPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNCartoonFunFacts from 'react-native-cartoon-fun-facts';

// TODO: What to do with the module?
RNCartoonFunFacts;
```
  