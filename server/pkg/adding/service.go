
package listing

import (
    "errors"
)

var ErrDuplicate = errors.New("SampleMessage already exists")

// Provides access to SampleMessage storage
type Persistence interface {
    // Returns sample message with given ID
    AddSampleMessage(SampleMessage) (SampleMessage, error)
}

// Provides SampleMessage listing operations
type Service interface {
    GetSampleMessage(int) (SampleMessage, error)
}

type service struct {
    r Persistence
}

// Creates new service for listing
func NewService(r Repository) Service {
    return &service{r}
}

// GetSampleMessage returns a beer
func (s *service) GetSampleMessage(id int) (SampleMessage, error) {
	return s.r.GetSampleMessage(id)
}

