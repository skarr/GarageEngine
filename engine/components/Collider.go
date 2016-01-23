package components

import (
	"github.com/skarr/GarageEngine/engine"
	"image"
)

type Collider struct {
	engine.BaseComponent
	Rect *image.Rectangle
}

func NewCollider() *Collider {
	return &Collider{engine.NewComponent(), nil}
}
