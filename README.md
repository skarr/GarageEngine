## GarageEngine
This is a 2d game engine written in Go working on OpenGL.
Its an Entity/Component based engine and right now contains lots of features such as: Font,Sprites,Texture packing,Physics,Depth layers,Scenes and more.
It feels like Unity3d and share the same names: Scene,Coroutines,Components,Transform,GameObjects etc...

This is an educational project, I'm learning as I go, I cannot promise backwards compatibility at this point.
the name will be probably changed.

## Install
You need to download glfw&glew libraries.

##### Windows
Use mingw and compile glew.

##### Ubuntu
Update package lists  
$ `sudo apt-get update`  
Install package dependencies  
$ `sudo apt-get install build-essentials binutils freeglut3 freeglut3-dev libglew-dev libxrandr2 libxrandr-dev libglfw2 libglfw-dev libxcursor-dev libxinerama-dev libalut-dev libxi-dev`  
Download GarageEngine  
$ `go get github.com/skarr/GarageEngine`

## To-Do list
Clean project:  
Name changing Engine -> engine etc...  
Function changing -> SetWorldPositionf -> SetWorldPosition2d etc...  

Atlas,Font - Clean whatever we can.  
Material - Think of design that does not require lots of work when creating custom shaders.  
Physics - Think of a better design for arbiter and clean & polish stuff.  
Scene - Get scene by name.  
Tree Behaviours - Clean & polish & new features.  
Camera - support multiple cameras.  
Rendering - support auto-batching.  
Coroutine - try to fix the bug that you cannot access to textures in Coroutines.  
Readme - explain Tree Behaviours.  
Learn from - https://github.com/runningwild/haunts .  
Comments - lacks tons of it.  



## Dependencies
github.com/go-gl-legacy/gl (built in ./lib)  
github.com/go-gl-legacy/glfw/v2.7/glfw (built in ./lib)  
github.com/vova616/chipmunk  
github.com/vova616/freetype-go/freetype

## Coroutines(they might be deprecated):
The useage is same as unity coroutines.  
Use Behaviour Trees, its better and faster.

## Behaviour Trees:
Example in SpaceCookies/game/EnemeyAI.go

## SpaceCookies
Mini game to test the engine, it will host server on port 3123 then you connect to it.
Make sure your executable file is in the same folder with the data folder.

## Videos:
http://www.youtube.com/watch?v=iMMbf6SRb9Q  
http://www.youtube.com/watch?v=BMRlY9dFVLg

## Coroutines Example
```
func (sp *PlayerController) Start() {
	as := StartCoroutine(func() { sp.AutoShoot() })

	StartCoroutine(func() {
		cr.Sleep(3)
		cr.YieldCoroutine(as) //wait for as to finish
		for i := 0; i < 10; i++ {
			cr.Skip()
			cr.Skip()
			cr.Skip()
			sp.Shoot()
		}
	})
}

func (sp *PlayerController) AutoShoot() {
	for i := 0; i < 3; i++ {
		cr.Sleep(3)
		sp.Shoot()
	}
}

func (sp *PlayerController) AutoShoot2() {
	for i := 0; i < 3; i++ {
		for i:=0;i<3*60;i++ {
			cr.Skip() //Frame skip
		}
		sp.Shoot()
	}
}

func (sp *PlayerController) AutoShoot3() {
	for i := 0; i < 3; i++ {
		done := make(chan bool)
		go func() {
			<-time.After(time.Second * 3)
			done <- true
		}()
		cr.YieldUntil(done)
		sp.Shoot()
	}
}
```
