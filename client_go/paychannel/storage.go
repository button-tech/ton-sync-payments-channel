package paychannel

type Storage struct {
	Storage []State
}

func CreateEmpty() Storage {
	return Storage{Storage: make([]State, 0)}
}

func (s *Storage) Add(state State) {
	s.Storage = append(s.Storage, state)
}

func (s *Storage) CanAddState(sender string) bool {
	var last = s.Storage[len(s.Storage)-1]
	return last.Sender == sender
}
